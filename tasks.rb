
require 'csv'
require 'datamapper_setup.rb'

=begin
puts "open csv file"
FasterCSV.foreach("ProductPages.csv") do |row|
  row.each_with_index do |v, i|
    next if v.nil?
    sub             = Subcategory.new
    sub.name        = v
    sub.category_id = (i + 1)
    sub.tmp         = (i + 1)
    sub.save
    puts "subtcat: [" + (i+1).to_s + "] " + v
  end
  puts '----------------------'
end
=end

=begin
INSERT INTO categories (name) VALUES 
("Regulators & Accessories"),
("Valves & Accessories"),
("Brass Couplings & Adapters"),
("Valves & Adapters"),
("Gauges & Accessories"),
("Ball Valves & Specialty Valves"),
("Y-Type Strainers, Tanks, Check, & Excess Flow Valves"),
("Pumps & Accessories"),
("Compressors & Accessories"),
("Vapor Compressor & Hand Pump"),
("Motors, Adjustable Motor Bases, & Switches"),
("Meters & Meter Accessories"),
("Hose & Hose Couplings"),
("Adapter Unions, Hose Assemblies, & Accessories"),
("Couplings, Hos Reels, & Accessories"),
("Permasert System from Perfection"),
("Gas Cocks & Flex Connectors"),
("Brass Fittings"),
("Pipe Fittings"),
("Miscellaneous Products & Safety Equipment"),
("Hand Burners"),
("Vaporizers"),
("Refrigerators & Cook Tops"),
("Heaters & Patio Heaters"),
("Rinnai Tankless Water Heaters & Accessories"),
("Dispenser Cabinets & Vertical & Horizontal Dispensers"),
("ASME Tanks"),
("Swivel Joints & Accessories");
=end

puts 'hello'

