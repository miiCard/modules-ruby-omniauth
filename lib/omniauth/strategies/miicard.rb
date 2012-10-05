require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
	module Strategies
		class MiiCard < OmniAuth::Strategies::OAuth
			option :name, 'MiiCard'
			
			option :client_options, {
				:access_token_path => "/auth/oauth.ashx",
				:authorize_path => "/auth/oauth.ashx",
				:request_token_path => "/auth/oauth.ashx",
				:site => "https://sts.miicard.com",
				:http_method => :get
			}
			
			uid {
				raw_info['Username']	
			}
			
			info do
				{
					:name			=> user_info[:name],
					:first_name		=> user_info[:first_name],
					:last_name		=> user_info[:last_name],
					:email			=> user_info[:email],
					:phone			=> user_info[:phone],
					:urls			=> user_info[:urls]
				}
			end
			
			extra do
				{
					:raw_info => raw_info,
					:user_hash => raw_info
				}
			end
									
			def raw_info
				@raw_info ||= (MultiJson.decode(access_token.post('/api/v1/Claims.svc/json/GetClaims').body)['Data']) if access_token
			rescue ::Errno::ETIMEDOUT
				raise ::Timeout::Error
			end
			
			def user_info
				@user_info ||= raw_info.nil? ? {} :
					{
						:name			=> raw_info['FirstName'] + " " + raw_info['LastName'],
						:name_public	=> raw_info['FirstName'] + " " + raw_info['LastName'],
						:first_name		=> raw_info['FirstName'],
						:last_name		=> raw_info['LastName'],
						:phone			=> (raw_info['PhoneNumbers'].nil? || raw_info['PhoneNumbers'].empty?) ? nil : '+' + raw_info['PhoneNumbers'][0]['CountryCode'] + raw_info['PhoneNumbers'][0]['NationalNumber'],
						:email			=> (raw_info['EmailAddresses'].nil? || raw_info['EmailAddresses'].empty?) ? nil : raw_info['EmailAddresses'][0]['Address'],
						:urls			=> !raw_info['HasPublicProfile'] ? nil : { "Identity assured by miiCard" => raw_info['ProfileUrl'] }
					}
			end
		end
	end
end