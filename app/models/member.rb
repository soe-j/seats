class Member < ActiveRecord::Base
  belongs_to :group

  def self.devide_groups(groups_num)

    members = Member.all.shuffle.sort_by {|mem| mem.year }

    members.each_with_index do |mem, idx|
      mem.group_id = idx % groups_num + 1
      mem.save
    end
  end
end
