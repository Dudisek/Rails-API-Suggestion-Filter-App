class Product < ApplicationRecord

  def self.filter(attributes)
    attributes.select { |k, v| v.present? }.reduce(all) do |scope, (key, value)|
      case key.to_sym
      when :q # regexp search
        scope.where(["name LIKE ?", "%#{value}%"])
      when :minprice # direct search
        scope.where("price >= #{value}")
      when :maxprice # direct search
        scope.where("price <= #{value}")
      when :cat # direct search
        scope.where("category = #{value}")
      else # unknown key (do nothing or raise error, as you prefer to)
        scope || []
      end
    end
  end

  def translate_category(category)
    category = {
      'id' => p.category, 
      'trans' => {
        'en' => (I18n.t "cat.#{p.category}"), 
        'es' => (I18n.t "cat.#{p.category}", locale: :es)
    }}
  end

end