module OrdersHelper

  def first_number_order
    data = Time.now
    order_data = data.strftime("%Y/%m/")
    order_first_number = order_data + "0001/0001"
    return order_first_number
  end

  def last_number_order
    last_order = Order.last
    puts "Ostatni numer Zamówienia - " + last_order.order_number
    return last_order.order_number
  end

  def check_order
    orders = Order.all
    if orders.size >= 1
      puts "liczba Zamwówień - " + orders.size.to_s
      last_number_order
      data = Time.now
      year = data.strftime("%Y")
      number_order = last_number_order.split('/')
      if number_order[0] != year
        puts " nowy ROK !!!!!!!!!!!!!!!!!!!!!!!"
        numberA = "/0001"
        numberB = next_number(number_order[3])
        number_order = data.strftime("%Y/%m") + numberA + numberB
        puts "Nastepny numer Zamówienia: " + number_order
        return number_order
      else
        puts "TEN SAM ROK"
        numberA = next_number(number_order[2])
        numberB = next_number(number_order[3])
        number_order = data.strftime("%Y/%m") + numberA + numberB
        puts "Nastepny numer Zamówienia: " + number_order
        return number_order
      end
    else
      puts "Brak Zamówień"
      return first_number_order
    end
  end

  def next_number(number)
    number = number.to_i
    number = number + 1
    number = number.to_s
    while number.length < 4
      number = "0"+number
    end
    number = "/" + number
    return  number
  end

  def next_order_number
    return check_order
  end
end
