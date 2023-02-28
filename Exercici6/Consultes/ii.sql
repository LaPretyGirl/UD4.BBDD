select count(distint(vol.id)) as “numero de vols reservats”
from reserva , vol
where reserva.id_vol = vol.id;