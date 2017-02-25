class Api < Grape::API
  mount V1 => 'v1'
end