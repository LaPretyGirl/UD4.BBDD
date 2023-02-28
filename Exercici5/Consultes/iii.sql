select *
from client, vehicle, tipus_vehicle, cites
where client.dni = vehicle.client_dni
and vehicle.tipus_vehicle.id = tipus_vehicle.id
and vehicle.matrícula = cites.vehicule_matrícula
