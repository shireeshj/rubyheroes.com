class Hero < ActiveRecord::Base
  def self.find(*args)
    if args.first.to_s == "random"
      ids = connection.select_all("SELECT id FROM "+table_name)
      super(ids[rand(ids.length)]["id"].to_i)
    else
      super
    end
  end
end
