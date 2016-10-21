class Product < ApplicationRecord

  def self.filter(attributes)
    attributes.select { |k, v| v.present? }.reduce(all) do |scope, (key, value)|
      case key.to_sym
      when :q # regexp search
        scope.where(["name LIKE ?", "%#{value}%"])
      when :minprice # min price filter
        scope.where("price >= #{value}")
      when :maxprice # max price filter
        scope.where("price <= #{value}")
      when :cat # category filter
        scope.where("category = #{value}")
      else # return scope or empty array
        scope || []
      end
    end
  end

  def translate_category(category)
    # Translate category to en and es with i18n
    category = {
      'id' => p.category, 
      'trans' => {
        'en' => (I18n.t "cat.#{p.category}"), 
        'es' => (I18n.t "cat.#{p.category}", locale: :es)
    }}
  end

end