<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\StayingHour;
use App\Models\Type;
use App\Models\Floor;
use App\Models\Room;
use App\Models\Rate;
use App\Models\HotelItems;
use App\Models\RequestableItem;

class AlmaResidenceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        StayingHour::create([
            'branch_id' => 1,
            'number' => 6,
        ]);
        StayingHour::create([
            'branch_id' => 1,
            'number' => 12,
        ]);
        StayingHour::create([
            'branch_id' => 1,
            'number' => 24,
        ]);

        $single = Type::create([
            'branch_id' => 1,
            'name' => 'Single size Bed',
        ]);
        $double = Type::create([
            'branch_id' => 1,
            'name' => ' Double size Bed',
        ]);
        $twin = Type::create([
            'branch_id' => 1,
            'name' => 'Twin size Bed',
        ]);

        $firstFloor = Floor::create([
            'branch_id' => 1,
            'number' => '1',
        ]);
        $secondFloor = Floor::create([
            'branch_id' => 1,
            'number' => '2',
        ]);
        $thirdFloor = Floor::create([
            'branch_id' => 1,
            'number' => '3',
        ]);
        $fourthFloor = Floor::create([
            'branch_id' => 1,
            'number' => '4',
        ]);
        $fifthFloor = Floor::create([
            'branch_id' => 1,
            'number' => '5',
        ]);

        Room::create([
            'number' => '1',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '5',
            'type_id' => $single->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '63',
            'type_id' => $single->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '64',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '123',
            'type_id' => $single->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '124',
            'type_id' => $single->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '203',
            'type_id' => $single->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '204',
            'type_id' => $single->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '256',
            'type_id' => $single->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '257',
            'type_id' => $single->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '11',
            'type_id' => $twin->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '15',
            'type_id' => $twin->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '16',
            'type_id' => $twin->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '18',
            'type_id' => $twin->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '23',
            'type_id' => $twin->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '26',
            'type_id' => $twin->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '70',
            'type_id' => $twin->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '73',
            'type_id' => $twin->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '74',
            'type_id' => $twin->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '77',
            'type_id' => $twin->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '81',
            'type_id' => $twin->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '84',
            'type_id' => $twin->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '130',
            'type_id' => $twin->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '133',
            'type_id' => $twin->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '134',
            'type_id' => $twin->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '137',
            'type_id' => $twin->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '151',
            'type_id' => $twin->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '154',
            'type_id' => $twin->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '210',
            'type_id' => $twin->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '214',
            'type_id' => $twin->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '215',
            'type_id' => $twin->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '218',
            'type_id' => $twin->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '222',
            'type_id' => $twin->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '225',
            'type_id' => $twin->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '4',
            'type_id' => $single->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '2',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '3',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '6',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '7',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '8',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '9',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '10',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '12',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '13',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '14',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '17',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '19',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '20',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '21',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '22',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '24',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '25',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '27',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '28',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '29',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '30',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '31',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '32',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '33',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '34',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '35',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '36',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '37',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '38',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '39',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '60',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '61',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '62',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '43',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '44',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '45',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '46',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '47',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '48',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '49',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '50',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '51',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '52',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '53',
            'type_id' => $double->id,
            'floor_id' => $firstFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '65',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '66',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '67',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '68',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '69',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '71',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '72',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '75',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '76',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '78',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '79',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '80',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '82',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '83',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '85',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '86',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '87',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '88',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '89',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '90',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '91',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '92',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '93',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '94',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '95',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '96',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '97',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '98',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '99',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '100',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '101',
            'type_id' => $double->id,
            'floor_id' => $secondFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '120',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '121',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '122',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '125',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '126',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '127',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '128',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '129',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '131',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '132',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '135',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '136',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '138',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '139',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '150',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '152',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '153',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '155',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '156',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '157',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '158',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '159',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '160',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '161',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '162',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '163',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '164',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '165',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '166',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '167',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '168',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '169',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '170',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '171',
            'type_id' => $double->id,
            'floor_id' => $thirdFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '200',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '201',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '202',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '205',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '206',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '207',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '208',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '209',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '211',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '212',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '213',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '216',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '217',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '219',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '220',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '221',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '223',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '224',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '226',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '227',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '228',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '229',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '230',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '231',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '232',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '233',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '234',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '235',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '236',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '237',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '238',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '239',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '250',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '251',
            'type_id' => $double->id,
            'floor_id' => $fourthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '253',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '254',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '255',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '258',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '259',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '260',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '261',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '262',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '263',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '264',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '265',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '266',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '267',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '268',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '269',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '270',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '271',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '272',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '273',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '274',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '275',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '276',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '277',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '278',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '279',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '280',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '281',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '282',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '283',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '284',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '285',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '286',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '287',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '288',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '289',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);
        Room::create([
            'number' => '290',
            'type_id' => $double->id,
            'floor_id' => $fifthFloor->id,
            'status' => 'Available',
            'branch_id' => 1,
        ]);

        HotelItems::create([
            'branch_id' => 1,
            'name' => 'MAIN DOOR',
            'price' => 5000,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'PURTAHAN SA C.R.',
            'price' => 2500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SUGA SA ROOM',
            'price' => 150,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SUGA SA C.R.',
            'price' => 130,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SAMIN SULOD SA ROOM',
            'price' => 1000,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SAMIN SULOD SA C.R.',
            'price' => 1000,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SAMIN SA GAWAS',
            'price' => 1500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SALOG SA ROOM PER TILES',
            'price' => 1200,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SALOG SA C.R. PER TILE',
            'price' => 1200,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'RUG/ TRAPO SA SALOG',
            'price' => 40,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'UNLAN',
            'price' => 500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'HABOL',
            'price' => 500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'PUNDA',
            'price' => 200,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'PUNDA WITH MANTSA(HAIR DYE)',
            'price' => 500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'BEDSHEET WITH INK',
            'price' => 500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'BED PAD WITH INK',
            'price' => 800,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'BED SKIRT WITH INK',
            'price' => 1500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'TOWEL',
            'price' => 300,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'DOORKNOB C.R.',
            'price' => 350,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'MAIN DOOR DOORKNOB',
            'price' => 500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'T.V.',
            'price' => 30000,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'TELEPHONE',
            'price' => 1000,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'DECODER PARA SA CABLE',
            'price' => 1600,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'CORD SA DECODER',
            'price' => 100,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'CHARGER SA DECODER',
            'price' => 400,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'WIRING SA TELEPHONE',
            'price' => 100,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'WIRINGS SA T.V.',
            'price' => 200,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'WIRING SA DECODER',
            'price' => 50,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'CEILING',
            'price' => 0,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SHOWER HEAD',
            'price' => 800,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SHOWER BULB',
            'price' => 800,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'BIDET',
            'price' => 400,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'HINGES/ TOWEL BAR',
            'price' => 200,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'TAKLOB SA TANGKE',
            'price' => 1200,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'TANGKE SA BOWL',
            'price' => 3000,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'TAKLOB SA BOWL',
            'price' => 1000,
        ]);

        HotelItems::create([
            'branch_id' => 1,
            'name' => 'ILALOM SA LABABO',
            'price' => 0,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'SINK/LABABO',
            'price' => 1500,
        ]);
        HotelItems::create([
            'branch_id' => 1,
            'name' => 'BASURAHAN',
            'price' => 70,
        ]);
        RequestableItem::create([
            'branch_id' => 1,
            'name' => 'EXTRA PERSON WITH FREE PILLOW, BLANKET,TOWEL',
            'price' => '100',
        ]);
        RequestableItem::create([
            'branch_id' => 1,
            'name' => 'EXTRA TOWEL',
            'price' => '20',
        ]);
        RequestableItem::create([
            'branch_id' => 1,
            'name' => 'EXTRA BLANKET',
            'price' => '20',
        ]);
        RequestableItem::create([
            'branch_id' => 1,
            'name' => 'EXTRA FITTED SHEET',
            'price' => '20',
        ]);
    }
}
