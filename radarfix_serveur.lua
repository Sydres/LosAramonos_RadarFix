--[[

########################
#                      #
#     Walter White     #
#                      #
#                      #
#         2018         #
#                      #
#                      #
########################

--]]

RegisterServerEvent('paiement:radar')

AddEventHandler('paiement:radar', function(prix)
  local source = source
    TriggerEvent('es:getPlayerFromId', source, function(user)
        user.removeBank(prix)
    end)
end)

---------------------NE SURTOUT PAS TOUCHER !!!!!!!!!!!!!---------------------

local CurrentVersion = '1.0.2'
local GithubResourceName = 'LosAramonos_RadarFix'

PerformHttpRequest('https://raw.githubusercontent.com/WalterWhite84/'.. GithubResourceName .. '/master/version', function(Error, NewestVersion)

		print('\n')
		print('##############')
        print('## Votre version de : ' .. GithubResourceName..' est la version : '..CurrentVersion)
        print('## Version disponible sur Github : ' .. NewestVersion)
        print('Lien ou recuperer la nouvelle version : https://github.com/WalterWhite84/LosAramonos_RadarFix')
		print('##############')
		print('\n')
	
end)

---------------------NE SURTOUT PAS TOUCHER !!!!!!!!!!!!!---------------------
