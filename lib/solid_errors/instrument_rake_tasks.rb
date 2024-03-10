require "rake/task"

module SolidErrors
  module Rake
    module Task
      def execute(...)
        Rails.error.record do
          super(...)
        end
      end
    end
  end
end

Rake::Task.prepend(SolidErrors::Rake::Task)
