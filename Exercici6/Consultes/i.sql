select passatgers.dni, passatgers.nom, passatgers.cognom, vol.nº_vol, vol.origen, vol.destí, reserva.import
from passatgers, Vol, Reserva
and peserves.vol_id = vol.id
and reserves.id = “ ”;