
require 'csv'
require 'ftools'
require 'datamapper_setup.rb'

desc "say hello"
task :hello do
  puts "Hello!"
end  

desc "add the main categories"
task :add_cats do 
  cats = [
    "Regulators & Accessories",
    "Valves & Accessories",
    "Brass Couplings & Adapters",
    "Valves & Adapters",
    "Gauges & Accessories",
    "Ball Valves & Specialty Valves",
    "Y-Type Strainers, Tanks, Check, & Excess Flow Valves",
    "Pumps & Accessories",
    "Compressors & Accessories",
    "Vapor Compressor & Hand Pump",
    "Motors, Adjustable Motor Bases, & Switches",
    "Meters & Meter Accessories",
    "Hose & Hose Couplings",
    "Adapter Unions, Hose Assemblies, & Accessories",
    "Couplings, Hos Reels, & Accessories",
    "Permasert System from Perfection",
    "Gas Cocks & Flex Connectors",
    "Brass Fittings",
    "Pipe Fittings",
    "Miscellaneous Products & Safety Equipment",
    "Hand Burners",
    "Vaporizers",
    "Refrigerators & Cook Tops",
    "Heaters & Patio Heaters",
    "Rinnai Tankless Water Heaters & Accessories",
    "Dispenser Cabinets & Vertical & Horizontal Dispensers",
    "ASME Tanks",
    "Swivel Joints & Accessories"
  ]
  cats.each do |cat|
    c = Category.new
    c.name = cat
    if c.save
      puts c.name
    end
  end
  
end


desc "add subcatories"
task :add_subcats do 
  puts "open csv file"
  FasterCSV.foreach("ProductPages.csv") do |row|
    row.each_with_index do |v, i|
      next if v.nil?
      sub             = Subcategory.new
      sub.name        = v
      sub.category_id = (i + 1)
      sub.save
      puts "subtcat: [" + (i+1).to_s + "] " + v
    end
    puts '----------------------'
  end
  
  cats = Category.all
  cats.each do |cat|
    cat.subcategories.first.destroy
  end  
end


desc "add all the subcategory item data"
task :add_data do 

  Dir.new('data').each do |file|
    #next if (file.index('.') == 0 || file.index('.verified'))
    next if file.index('.') == 0
  
    cat_id = file.split('.')[0]
    cat = Category.get(cat_id)
    subs = cat.subcategories
    puts cat.name
    
    groups = []
    titles = []
    count = 0
    last_row = nil
  
    path = File.join('data', file) 
    FasterCSV.foreach(path) do |row|
      if row.nil? || row.empty?
        last_row = row
        next
      end 

      if row.length == 1 && (last_row.nil? || last_row.empty?)
        name = subs[count] ? subs[count].name : ''
        puts row[0] + " (Parsed)"
        puts name + " (DM)" 
        puts "------------------------"

        titles.push(row[0])
        groups[count] = ''
        count += 1
      else
        groups[count-1] += "<tr><td>" + row.join(' </td><td> ') + "</td></tr>"
      end
      last_row = row
    end  

    puts groups.length
    groups.each_with_index do |v, i|
      sub = subs[i]
      next if sub.nil?
      sub.data = "<table>" + v + "</table>"
      sub.save
    end

  end

end
