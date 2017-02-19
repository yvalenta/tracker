class DataDecompose

  def call(data)
  end

  def codec_id(data)
    data[0..1]
  end

  def number_data(data)
    data[2..3]
  end

  def decompose_data(data)
    byebug
    new_data = data[4..-1]
    array_data = []

    #number_data(data).hex.times do
    #  array_data << "#{timestamp(new_data)};#{priority(new_data)};#{gps_element(new_data)}"
    #  new_data = new_data[83..-1]
    #end

    (1..number_data(data).hex).each do
      array_data << "#{timestamp(new_data)};#{priority(new_data)};#{gps_element(new_data)}"
      new_data = new_data[83..-1]
    end
    array_data
  end

  def timestamp(data)
    date = data[0..15].hex
    @timestamp ||= DateTime.strptime("#{date}",'%s').strftime("%d-%m-%Y %H:%M:%S")
  end

  def priority(data)
    @priority ||= data[16..17]
  end

  def gps_element(data)
    @gps_element ||= "#{data[18..25].hex};#{data[26..33].hex};#{data[34..37].hex};#{data[38..41].hex};#{data[42..43].hex};#{data[44..47].hex}"
  end

  def io_element(data)
  end

end
