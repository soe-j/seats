class Group < ActiveRecord::Base
  has_many :members

  def self.create_q num
    num.times do |idx|
      Group.find_or_create_by(id: idx + 1) do |g|
        g.name = series_name("A", idx + 1)
      end
    end
  end

private
  def self.series_name str, num
    num > 1 ? series_name(str, num - 1).next : str
  end
end
