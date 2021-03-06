module Tufy
  module Fields
    module Name
      class BuildCivilStatusField < BuildField
        expects :raw_data
        promises :transformed_data

        executed do |ctx|
          ctx.transformed_data =
            ctx.transformed_data +
            transform(ctx).upcase
        end

        private

        def self.transform(ctx)
          raw_data = ctx.raw_data

          BuildNameSegment::Constants::CIVIL_STATUS_TAG +
            FormatStrings::F2TS % raw_data[:civil_status].size +
              raw_data[:civil_status]
        end
      end
    end
  end
end
