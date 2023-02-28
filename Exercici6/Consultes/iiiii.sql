select reserva.id, passatgers.nom
from passatgers, vol ,reserva
where passatgers.dni, = reserva.dni_passatgers
and reserva.id_vol = vol.id
vol.data > “6/5/2022”;