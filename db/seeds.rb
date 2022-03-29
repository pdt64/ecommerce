# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

RecordProducer.delete_all
RecordWriter.delete_all
Record.delete_all
Genre.delete_all
Writer.delete_all
Producer.delete_all

csv_file = Rails.root.join("db/records.csv")
csv_data = File.read(csv_file)

songs = CSV.parse(csv_data, headers: true)

songs.each do |s|
  genre = Genre.find_or_create_by(name: Faker::Music.genre)

  if genre && genre.valid?
    # create the movie
    song = genre.records.create(
      name:        s["title"],
      description: s["description"],
      sale:        false,
      price:
    )

    unless song&.valid?
      puts "Invalid song #{s['title']}"
      next
    end

    writers = s["writers"].split(",").map(&:strip)

    writers.each do |w|
      writer = Writer.find_or_create_by(writer_name: w)

      RecordWriter.create(song: song, writer: writer)
    end

    producers = s["producer"].split(",").map(&:strip)

    producers.each do |p|
      producer = Producer.find_or_create_by(producer_name: p)

      RecordProducer.create(song: song, producer: producer)
    end
  else
    puts "invalid genre #{s['genre']} for movie #{s['title']}."
  end
end