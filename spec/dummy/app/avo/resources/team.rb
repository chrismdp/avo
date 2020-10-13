module Avo
  module Resources
    class Team < Resource
      def initialize
        @title = :name
        @search = [:id, :name]
      end

      fields do
        id
        # text :name
        title :name, name: 'Nname'
        textarea :description, rows: 5, readonly: false, hide_on: :index, format_using: -> (value) { value.to_s.truncate 30 }, default: 'This team is wonderful!', nullable: true, null_values: ['0', '', 'null', 'nil']

        number :members_count do |model|
          model.members.count
        end

        color_picker :color, allow_non_colors: true

        has_one :admin
        has_many :members
      end
    end
  end
end
