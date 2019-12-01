class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = ["item1", "item2", "item3"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end
    
    if req.path.match(/cart/)
      @@cart.each do |item|
        resp.write "#{item}"
      end
    elsif req.path.match(/search/)
    search_term = req.params["q"]
    resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end
  
  def add(item)
    if @@items.include?(item)
      resp.write "we have the #{item}"
    else
      @@items << item.to_s
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
