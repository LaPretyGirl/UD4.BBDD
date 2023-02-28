select avió.marca, avió.model, avió.capacitat, vol.id, vol.data, vol.hora, reserva.orgien, reserva.destí, vol.hora_arribada
from avió, vol, reserva
where avió.marca = “Airbus”;
and avió.id = vol.id = vol.avió
and reserves_vol_id= vol.id;
