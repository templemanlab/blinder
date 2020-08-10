#!/usr/bin/env ruby

require 'csv'

Dir.chdir File.dirname(__FILE__)

class String
  def green;          "\e[32m#{self}\e[0m" end
  def yellow;         "\e[33m#{self}\e[0m" end
end

if !File.exist?("mapping.csv")
  mapping = {}
  Dir.glob("*") do |filename|
    next if filename == File.basename($0)

    randomized_name = ('a'..'z').to_a.sample(10).join + File.extname(filename)
    File.rename(filename, randomized_name)
    mapping[randomized_name] = filename
  end

  mapping = Hash[mapping.sort]

  CSV.open("mapping.csv", "wb") do |csv|
    csv << ['Key', 'Filename']

    mapping.each do |row|
      csv << row
    end
  end

  count = mapping.keys.length
  puts "Randomized #{count} file#{'s' if count != 1}".green
else
  puts('Folder already contains mapping.csv. Unrandomizing...'.yellow)
  puts

  count = 0
  CSV.foreach('mapping.csv', headers: true) do |row|
    puts "#{row['Key']} => #{row['Filename']}"
    File.rename(row['Key'], row['Filename'])

    count += 1
  end
  puts

  print "Deleting the mapping CSV file... ".yellow
  File.delete('mapping.csv')
  puts "Done".yellow

  puts
  puts "Unrandomized #{count} file#{'s' if count != 1}".green
end
