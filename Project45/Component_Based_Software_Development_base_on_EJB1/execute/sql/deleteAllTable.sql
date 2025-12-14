delete olala_wedding_contact

delete tour;
delete tour_contact;
delete tour_service;

delete gift;
delete gift_contact;
delete gift_service;

delete entertain;
delete entertain_service;
delete entertain_contact;

delete hotel;
delete hotel_contact;
delete seminar_service;
delete food_service;
delete cake_service;
delete room_service;
delete flower_service;

delete Photo;
delete Photo_contact;
delete Photoinwedding_service;
delete Photoinstudio_service;

commit
select * from customer
select * from olala_wedding_contact
select * from gift
select * from hotel
select * from photo
select * from tour
select * from entertain
rollback


