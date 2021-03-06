# See README.md for copyright details

class Api::V1::Filters::CreatedAfterFilter
  def self.filter(params)
    [ "created_at >= :created_after", {created_after: params[:created_after].to_datetime} ]
  end
end