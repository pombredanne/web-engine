# Notes on the architecture of prospective service

##Initial design - web system architecture 
The ÐL system consitutes a server, a system daemon available for installation on \*nix systems through usual means 
(repositories or compilation). It is designed to be installed on casual cloud/hardware servers 
with moderate CPU/HDD capacity. It requires basic configuration through usual textual config (YAML probably).
It carries full Ethereum blockchain client in itself, though that needs no setup of it's own, is 
installed automatically along with ÐL server and maintained by it. Optionally ÐL can be repointed to use any other 
arbitrary Ethereum client, as long as compatible JSON RPC API is available.

ÐL server itself is expected to be accessible on port 80 through a subdomain of the website's main domain, 
and be allowed to talk directly to the user's browser. ÐL server will provide simple HTTP API for website frontend
integration. Also we will provide a complimentary JS library to further simplify integration.

###Keys handling and blockchain interaction
User and web counterparty have own private keys, one for each. Handling private keys by the user is beyond 
the scope for now. User provides his private key on registration, a multisig transaction is created with 
both keys and saved on blockchain. Every new user-service pair creates a new multisig blockchain account. 
User settings for other systems can be read from the blockchain but cannot be edited by the service.

Optionally we may supply user with a browser plugin that will pick up unsigned transation from the website 
page and sign it in browser without exposing key to the web service. 
Pros - key no exposed, Cons - needs additional plugin installed.

###Questions
- Instead of every webservice using their own daemon we can provide it as a SaaS. Will slightly centralise things, 
but provide reliable revenue model.
- Creating separate multisig entries on blockchain for every user-service intersection might be space consuming.
  need to research into if it's possible to attach multiple signatures to one account if settigns on various
  services are identical for the same user.
- Even though we have only multisigs used, is the exposure of user's private key to all involved 
web services is acceptable?


##Further down the line
####IoT architecture.
Same ÐL daemon as for Web, but sitting on the local system and interacting with SPV instead of full blown geth. 
If IoT has web based interface - then JS library same way as with the web solution. Otherwise daemon will 
serve HTTP REST API on the localhost, and they integrate with it.

_temporary substitute_
_It is possible to work with a remote server same way the Web architecture may work. Will require remote server though._
_This is an option for SaaS model, though not ideal_

#####Security & blockchain model:
IoT appliance has key seed hardcoded in it. The private key is deterministically derived from the seed, while being 
random and unique for each device. Seed itself is public. User's private key is provided by the user on initial 
IoT config _(way to tranfer private key securely is open question)_. The multisig of user's key and unique app-device 
key is used to save the settings on the blockchain.
 

####Mobile architecture.
Separate mobile app, incorporating SPV client inside itself. Is requested to be installed by the target app when user
tries to use it. Client app interacts with ÐL app on demand, while implementing own interface for user interaction.
Alternatively user may be sent to ÐL app for preferences selection and then sent back to client app when 
ÐL configuration is done.

_temporary substitute_
_It is possible to work with a remote server same way the Web architecture may work. Will require remote server though._
_This is an option for SaaS model, though not ideal_


#####Security & blockchain model:
Mobile app has key seed hardcoded in it. The private key is deterministically derived from the seed, while being 
random and unique for each device. Seed itself is public. User's private key is stored in the ÐL app. 
The multisig of user's key and unique app-device key is used to save the settings on the blockchain.
This gives traceback to the app owner while not saving the key itself in the public app.


####Open questions
- How to securely and easily transfer private key onto IoT device?
