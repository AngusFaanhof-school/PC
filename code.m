vid = videoinput('winvideo',1);
start(vid);

%robot = legoev3('usb');

leftMotor = motor(robot, 'A');
rightMotor = motor(robot, 'C');

sonar = sonicSensor(robot);

moveSpeed = 30;
leftMotor.Speed = moveSpeed;
rightMotor.Speed = moveSpeed;

start(leftMotor);
start(rightMotor);
while(1)
    distance = readDistance(sonar);
    
    command = "g";
    
    if (distance < 0.2)
        stop(leftMotor);
        stop(rightMotor);
        pause(1);
        [v, ~, f, im] = takeImageAndGetVect(vid);
        imshow(f);
        y = net(v);
        command = getDirectionFromVect(y);
        %d = input("Should we move " + command + " ?", 's');
        %if d == "n"
        %    continue;
        %end
        disp(y);
    end
    
    if (command == "g")
        start(leftMotor);
        start(rightMotor);
        pause(0.01);
    elseif (command == "l")
        stop(leftMotor);
        start(rightMotor);
        pause(1.63);
        stop(rightMotor);
    elseif (command == "r")
        start(leftMotor);
        stop(rightMotor);
        pause(1.63);
        stop(leftMotor);
    end
end