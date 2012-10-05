modules-ruby-omniauth
=====================

This gem is a miiCard strategy for [OmniAuth](https://github.com/intridea/omniauth) 1.0. 

For more information about the miiCard API see http://www.miicard.com/developers, or the Ruby miiCard API wrapper on [RubyGems.org](https://rubygems.org/gems/miiCardConsumers) or [GitHub](https://github.com/miiCard/api-wrappers-ruby). Note that this strategy stands alone from the miiCard API wrapper.

##What is miiCard
miiCard lets anybody prove their identity to the same level of traceability as using a passport, driver's licence or photo ID. We then allow external web applications to ask miiCard users to share a portion of their identity information with the application through a web-accessible API.

##Usage
For rails users, add the gem to your Gemfile:

    gem 'omniauth-miicard'

Add the following to config/initializers/omniauth.rb:

    Rails.application.config.middleware.use OmniAuth::Builder do
        provider :miicard, 'YOUR CONSUMER KEY', 'YOUR CONSUMER SECRET'
    end

Obtain a consumer key and secret by requesting them from miiCard over at the [developers site](http://www.miicard.com/developers/getting-started).

Log a user in using their miiCard by directing them to the URL /auth/MiiCard.

##Dependencies
The gem takes dependencies only on OmniAuth. You may wish to make subsequent calls to the miiCard API using the credentials that are returned by this OmniAuth strategy, in which case you should also see the Ruby miiCard API wrapper on [RubyGems.org](https://rubygems.org/gems/miiCardConsumers) or [GitHub](https://github.com/miiCard/api-wrappers-ruby).

##Contributing
* Use GitHub issue tracking to report bugs in the library
* If you're going to submit a patch, please base it off the development branch (if one exists) - the master reflects the latest version published to RubyGems.org but may not necessarily be bleeding-edge
* Join the [miiCard.com developer forums](http://www.miicard.com/developers) to keep up to date with the latest releases and planned changes

##License
Copyright (c) 2012, miiCard Limited
All rights reserved.

http://opensource.org/licenses/BSD-3-Clause

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 

- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

- Neither the name of miiCard Limited nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
