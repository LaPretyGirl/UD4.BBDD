select Cites.ID , Cites.Dia , Cites.Hora , Tipus_de_vehicle.Tipus_vehicle , Vehicle.Marca , Client.Nom
from client, vehicle, tipu_de_vehicle, cites
where client.dni = vehicle.client_dni
and vehicle.matrícula = tipus_vehicle.vehicle_matrícula
and  cites.data > ‘9/13/2010’