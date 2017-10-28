module QueryHelper
  def self.get_simple_query(args)
    keys, params, query = args[:keys], args[:params], args[:starter] || "id > 0"

    # Go through keys and compile a query string
    keys.each do |key_obj|
      val = params[key_obj[:key]]
      next if val.blank?

      # Add value to query
      query = "#{query} #{key_obj[:operator].to_s} #{key_obj[:key].to_s}=#{val}"
    end
    return query
  end
end