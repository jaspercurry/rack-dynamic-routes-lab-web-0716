class Application


  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        item_name = req.path.split("/items/")[1]

        counter = []
        @@items.each do |item|

          if item.name == item_name
            resp.write "#{item.price}\n"

          else
            counter << false
              if counter.count == @@items.count
                resp.write "Item not found\n"
                resp.status=400
              end
          end
        end

      else
        resp.write "Route not found\n"
        resp.status=404


      end

      resp.finish
    end

end
#
#


#   @@items = ["Apples","Carrots","Pears"]
#   @@cart = []
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/cart/)
#       @@cart.each do |item|
#         resp.write "#{item}\n"
#       end
#       if @@cart.empty?
#         resp.write "Your cart is empty\n"
#       end
#
#     elsif req.path.match(/add/)
#     add_item = req.params["item"]
#       if @@items.include?(add_item)
#         @@cart << add_item
#         resp.write "added #{add_item}\n"
#       else
#         resp.write "We don't have that item\n"
#       end
#     elsif req.path.match(/search/)
#       search_term = req.params["q"]
#       resp.write handle_search(search_term)
#     else
#       resp.write "Path Not Found"
#     end
#
#     resp.finish
#   end
#
#   def handle_search(search_term)
#     if @@items.include?(search_term)
#       return "#{search_term} is one of our items"
#     else
#       return "Couldn't find #{search_term}"
#     end
#   end
# end
