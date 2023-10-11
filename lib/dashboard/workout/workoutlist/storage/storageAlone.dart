
class exer {

  static repsets(var c){
    List minset = ['Forearm Plank', 'Plank Crunch', 'Plank Jacks',
      'Plank Piston', 'Plank-Walkout','Iron Cross'];
    List min3set = ['Stair Climbing', 'Skipping', 'Squat Jump',
      'Side Jumping', 'Burpee'];
    List warmup = ['Arm-Circles', 'Jumping Jacks', 'Side Walk Jacks',
      'March Arm Swing', 'Back Lunges'];
    var sets = 3.0;
    String set = '';
    set = sets.toInt().toString();
    if(minset.contains(c)){return '1 minute, $set sets';}
    if(min3set.contains(c)){return '3 minutes, $set sets';}
    if(warmup.contains(c)){return '16 counts, 2 sets';}
    else{return '12 Repetition, $set sets';}
  }

  static subDesc(var s){
    var handle;
    switch (s){
      case 'Forearm Plank':
        handle = '1. Assume a push-up position but bend your arms at your elbows so your weight rests on your forearms\n'
            '2. Tighten your abs, clench your glutes and keep your body straight from head to heels. \n'
            '3. Hold as long as you can. ';
        break;
      case 'Plank Crunch':
        handle = '1. Assume a push-up positions\n'
            '2. Bend your left arm into a forearm plank then follow with right arm doing the same\n'
            '3. Unbend your left arm into a push up position and same with right arm after';
        break;
      case 'Plank Jacks':
        handle = '1. Assume a push-up positions\n'
            '2. While your arms in stationary, skip and spread your legs wide.\n'
            '3. Skip again and go back to last position of the exercise';
        break;
      case 'Plank Piston':
        handle = '1. Assume a in a forearm position\n'
            '2. Bend your hips to your left side and then go back to the same position\n'
            '3. Bend your hips to your right side and then go back to the same position';
        break;
      case 'Plank-Walkout':
        handle = '1. In standing position, bend over where your hands touch the ground\n'
            '2. While your legs are in stationary, walk your hands forward\n'
            '3. End the walk with a push up position and then stand up again';
        break;
      case 'Iron Cross':
        handle = '1. Lay down with stomach upwards. \n'
            '2. Lift your legs straight upwards then stay still.\n'
            '3. Bend your stomach to your right. following your legs to fall to right. do the same with your left';
        break;
      case 'Standard Push':
        handle = '1. Contract your abs and tighten your core by pulling your belly button toward your spine. \n'
            '2. Inhale as you slowly bend your elbows and lower yourself to the floor, until your elbows are at a 90-degree angle.\n'
            '3. Exhale while contracting your chest muscles and pushing back up through your hands, returning to the start position. ';
        break;
      case 'Decline Push Up':
        handle = '1. Grab a chair or any object with the same height and then place your foot with the object and your hands on the floor. \n'
            '2. In a push up position, slowly bend your hands to perform a standard push up\n'
            '3. Push back and return to the starting position';
        break;
      case 'Incline Push Up':
        handle = '1. Grab a chair or any object with the same height and then place your foot on the ground and your hands on the object. \n'
            '2. In a push up position, slowly bend your hands to perform a standard push up\n'
            '3. Push back and return to the starting position';
        break;
      case 'Diamond Push Up':
        handle = '1. In a push up position, place your both hands near each other.\n'
            '2. Make an L-shape with your left fingers and do the same with your right, your hands should forming a diamond shape\n'
            '3. While in that position, bend your arms down and up to do a push up.';
        break;
      case 'Wide Push Up':
        handle = '1. In a push up position, place your both hands far each other.\n'
            '2. Place your arms far enough to straighten both triceps with your back.\n'
            '3. While in that position, bend your arms down and up to do a push up.';
        break;
      case 'Side Push up':
        handle = '1. Lay down on your sides.\n'
            '2. With the top hand from the side, touch the ground while the other hand keep near in chest.\n'
            '3. Start pushing with the hand touching the ground and then go back to previous position';
        break;
      case 'Back Lunges':
        handle = '1. On standing position, step your left foot backwards.\n'
            '2. Bend your right foot and your left foot so that your body goes down.\n'
            '3. Go back again and do the same with right foot stepping in the back.';
        break;
      case 'Calf Raises':
        handle = '1. On standing position, rest your feet flat ground and pointing forwards.\n'
            '2. Lift your body with both left and right foot\'s calves and form a tip toe position.\n'
            '3. Release the tension of your foot and go back to previous position.';
        break;
      case 'Standard Squat':
        handle = '1. On standing position, rest your feet flat ground and pointing forwards.\n'
            '2. Bend down both your knees into a 90 degrees angle or more.\n'
            '3. Go back and straighten up again your position.';
        break;
      case 'Squat Jump':
        handle = '1. On standing position, rest your feet flat ground and pointing forwards.\n'
            '2. Jump with your calves and toes, then spread your legs upon landing.\n'
            '3. Quickly bend your knees in to a squat position and then jump back to starting position.';
        break;
      case 'Wall Squat':
        handle = '1. Find a straight wall and then press your back against the wall\n'
            '2. Bend your knees into a 90 degrees angle.\n'
            '3. Use only the tension with your foot and do not put weight your back. Stay on your position until the counter runs out.';
        break;
      case 'Quick sessions Squat':
        handle = '1. On standing position, rest your feet flat ground and pointing forwards.\n'
            '2. Bend down both your knees into a 90 degrees angle or more.\n'
            '3. Go back and straighten up again your position. (this time in quick and agile repetition)';
        break;
      case 'Burpee':
        handle = '1. Start on a standing position. \n'
            '2. Bend down your knees and continue to go down until your both hands are touching the floor.\n'
            '3. While touching the floor, jump and place your foot backwards to achieve a push up position.\n'
            '4. Undo your actions starting from step 3 to step 1.';
        break;
      case 'Plank Crawl':
        handle = '1. Assume a push up position then bend your arms so that your forearms are touching the ground.\n'
            '2. Start lift and crawl your left arm at the same time move and step with your right foot.\n'
            '3. After that, do the same with your right arm and left foot.';
        break;
      case 'Side Jumping':
        handle = '1. Bend your knees at almost 60 degrees angle.\n'
            '2. Jump to your left while still facing forward.\n'
            '3. Jump again to your right to place where you started.';
        break;
      case 'Skipping':
        handle = '1. Start on a standing position.\n'
            '2. Raise a leg and then back to its position. while bringing it back, raise the other foot and do the same.\n'
            '3. Continue with a walking motion without moving in place.';
        break;
      case 'Stair Climbing':
        handle = '1. Grab a small chair or find any place that has an elevation.\n'
            '2. Start to step by one foot and then followed by your other foot.\n'
            '3. Demotion your position by stepping back a foot, following the other.';
        break;
      case 'Mountain Climb Plank':
        handle = '1. Start in a planking position.\n'
            '2. Bend your one foot up to your stomach then position it again to previous position.\n'
            '3. Do that with the other foot while your hands are still in place.';
        break;
      case 'Arm-Circles':
        handle = '1. Start in a standing position.\n'
            '2. Raise your hands Perpendicular to your body (form a T pose).\n'
            '3. Start doing a circle motion with both hands.';
        break;
      case 'Jumping Jacks':
        handle = '1. Start in a standing position.\n'
            '2. Jump, while midair, raise your hands over to head parallel to body and spread your legs to your side.\n'
            '3. Jump again while going back with a standing position.';
        break;
      case 'Side Walk Jacks':
        handle = '1. Start in a standing position.\n'
            '2. Step one foot to its side and then followed by the other foot, simultaneously both your hand raise above your head.\n'
            '3. Step with the other foot to go back to starting position, simultaneously both hands are raise down to waist level.';
        break;
      case 'March Arm Swing':
        handle = '1. in a standing position, raise and bend a foot.\n'
            '2. While raising a foot, both hands swing to front creating a cross.\n'
            '3. Raise down the leg with both hands setting to your side. Do the same with the other foot with same steps.';
        break;
      case 'Bridges':
        handle = '1. Lay down in your stomach with your knee upwards.\n'
            '2. Raise your stomach to straighten your hips and body.\n'
            '3. Keep the position until the time is up.';
        break;

    }

    return handle;
  }


}