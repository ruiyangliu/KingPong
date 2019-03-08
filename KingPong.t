%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                              %%
%%           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           %%
%%           @@        Program Name: King Pong                     @@           %%
%%           @@  Programmer's Name : Ruiyang Liu                   @@           %%
%%           @@                For : Grade 11 CS Final Project     @@           %%
%%           @@       Date Working : Monday, May 27, 2008          @@           %%
%%           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           %%
%%                                                                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                %
%  PROGRAM DESCRIPTION:                                                          %
%                                                                                %
%       This program will import Turing's GUI and create a menu that the user    %
%       can interact with. The first screen shown when ran is the title screen   %
%       of the game. There are several tabs the user can choose from in the      %
%       dropdown menu at the top of the screen. The new game button will allow   %
%       the user to change the default settings such as the size of the paddle,  %
%       the amount of games that be played, the size of the ball, and the size   %
%       of the power ups. The Help and About menus' only purpose is to inform    %
%       the user about the controls and the credits.                             %
%                                                                                %
%       When the user selects the New Game button, the user will be prompted for %
%       Player 1's name and Player 2's name. As soon as the names are inputted,  %
%       the user will be immediately put into the main game play. The default    %
%       rounds the players will play will be 10 rounds each. The first player    %
%       who scores 10 points will end the game. After the game has ended, the    %
%       result will be saved to a disk and pulled up from the Records menu. Then %
%       the user will be put back into the main screen and the program will wait %
%       more commands.                                                           %
%                                                                                %
%       When the user selects the Settings button, the program will display the  %
%       current game settings. Then the user will be asked to make changes to    %
%       any to these settings. Several settings involves the size of paddle, the %
%       amount of games that they will play, the size of the ball as well as the %
%       size of power ups.                                                       %
%                                                                                %
%       When the user selects the Help button, the user will be told the         %
%       commands of the game as well as the objective. The user will also be     %
%       informed of what of what possible power ups are available in the game.   %
%                                                                                %
%       When the user selects the About King Pong button, the user will be       %
%       shown the credits to this program. This will also serve as a             %
%       bibliography as well as give credits to people who have helped on this   %
%       program.                                                                 %
%                                                                                %
%       When the user selects the Quit button, the program will obviously exit   %
%       the program. The command "GUI.Quit" will be used, but the window will    %
%       also be destroyed, causing a more effective quit button.                 %
%                                                                                %
%  LIST OF VARIABLES:                                                            %
%                                                                                %
%                 (Integer Variable)                                             %
%                                                                                %
%       winID - The window created to contain the program.                       %
%                                                                                %
%       fileMenu - The menu group labeled "File"                                 %
%                                                                                %
%       helpMenu - The menu group labeled "Help"                                 %
%                                                                                %
%       powerUp - A random integer will be assigned to this variable. This will  %
%                 affect what the power up will do when a player hits the ball   %
%                 onto a power up. This will be initialized to 0.                %
%                                                                                %
%       initSize - This value will determine both player's initial size of both  %
%                  paddles.                                                      %
%                                                                                %
%       p1Size - This value will determine the size of player 1's paddle.        %
%                Initialized the same as the initSize, values will change        %
%                if the player hits a power up.                                  %
%                                                                                %
%       p2Size - This value will determine the size of player 2's paddle.        %
%                Initialized the same as the initSize, values will change        %
%                if the player hits a power up.                                  %
%                                                                                %
%       ballX - The value will be the X coordinate of the ball.                  %
%                                                                                %
%       ballY - The balue will be the Y coordinate of the ball.                  %
%                                                                                %
%       xDirection - The value determines which direction the ball is traveling  %
%                    on the X coordinate. If the value is positive, then the     %
%                    ball is traveling to the right side of the screen. If the   %
%                    value is negative, then the ball is traveling to the left   % 
%                    side of the screen.                                         %
%                                                                                %
%       yDirection - The value determines which direction the ball is traveling  %
%                    on the Y coordinate. If the value is positive, then the     %
%                    ball is traveling to the top of the screen. If the value    %
%                    is negative, then the ball is traveling to the bottom of    %
%                    the screen.                                                 %
%                                                                                %
%       p1Y - The value will determine the Y coordinate of player 1's paddle.    %
%                                                                                %
%       p2Y - The value will determine the Y coordinate of player 2's paddle.    %
%                                                                                %
%       p1Score - The value will determine how many points player 1 has scored.  %
%                                                                                %
%       p2Score - The value will determine how many points player 2 has scored.  %
%                                                                                %
%       maxScore - The maximum score a player can reach before the game is over. %
%                                                                                %
%       initSpeed - The initial speed of the both players' paddles.              %
%                                                                                %
%       p1Speed - The speed Player 1's paddle moves up and down the screen.      %
%                                                                                %
%       p2Speed - The speed Player 2's paddle moves up and down the screen.      %
%                                                                                %
%       pUp_X - The X coordinate the power up will appear at.                    %
%                                                                                %
%       pUp_Y - The Y coordinate the power up will appear at.                    %
%                                                                                %
%       pUpSize - The radius of the power up circle.                             %
%                                                                                %
%       ballSize - The radius of the ball.                                       %
%                                                                                %
%       initBallSpeed - The initial xDirection speed.                            %
%                                                                                %
%                 (String Variables)                                             %
%                                                                                %
%       p1Name - The name of Player 1.                                           %
%                                                                                %
%       p2Name - The name of Player 2.                                           %
%                                                                                %
%  LIST OF ARRAYS:                                                               %
%                                                                                %
%                 (Array Char of Boolean)                                        %
%                                                                                %
%       keys - This array holds all of the keys on the keyboard and set their    %
%              value to false. If a key is pressed, then the value will return   %
%              true.                                                             %
%                                                                                %
%                 (Array of Int)                                                 %
%                                                                                %
%       item (1 to 7) - This array will contain the number of menu items used    %
%                       in this program.                                         %
%                                                                                %
%                 (Array of String)                                              %
%                                                                                %
%       name - This array will contain all of the menu option names as well as   %
%              the breaks between two sections in the menu. Some of the menu     % 
%              options contain, New Game, Settings, Records, Quit, Help, and     %
%              About King Pong.                                                  %
%                                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

import GUI

View.Set ("nobuttonbar")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VARIABLES & INITIALIZATIONS %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% VARIABLES

var winID, fileMenu, helpMenu, powerUp, p1Size, p2Size, initSize, ballX,
    ballY, xDirection, yDirection, p1Y, p2Y, p1Score, p2Score, initSpeed,
    p1Speed, p2Speed, maxScore, pUpX, pUpY, pUpSize, ballSize, initBallSpeed : int

var p1Name, p2Name : string

var keys : array char of boolean

var item : array 1 .. 7 of int

var name : array 1 .. 7 of string :=
    init ("New Game", "Settings", "---", "Quit",
    "Help", "---", "About KingPong")


%--CREATE THE WINDOW--
var ch : string (1)
winID := Window.Open ("graphics:639;399")
%---------------------


% ADJUSTABLES
%These values may be changed in the settings menu.

%--ORIGINAL PADDLE SIZE--
initSize := 35
%------------------------

%--MAXIMUM ROUNDS--
maxScore := 10
%------------------

%--PADDLES' SPEEDS--
initSpeed := 2
%-------------------

%--BALL'S SPEED--
initBallSpeed := 1
%----------------

%--BALL SIZE--
ballSize := 7
%-------------

%--POWER UP SIZE--
pUpSize := 10
%-----------------


% INITIALIAZATION

%--BALL'S COORDINATE--
ballX := 320
ballY := 190
%---------------------

%--BALL'S MOVEMENT--

%If the number is positive on the X Direction,
%then the ball is moving to the right. Negative
%will move the ball to the left.
xDirection := initBallSpeed

%If the number is positive on the Y Direction,
%then the ball is moving to the top. Negative
%will move the ball to the bottom. A higher number
%will make the ball go faster.
yDirection := 1

%-------------------

%--PADDLE'S COORDINATES--
p1Y := 200
p2Y := 200
%------------------------

%--PADDLE'S SIZES--

%These variable do not contain specific numbers
%since the user can just edit one variable to change
%the value of both of these variables. These variables
%are nessessary because a player hitting the powerup
%should only affect his own size. With both players'
%paddles using different variables, this is possible.

p1Size := initSize
p2Size := initSize
%------------------

%--PADDLES' SPEEDS--
p1Speed := initSpeed
p2Speed := initSpeed
%-------------------

%--SCORES--
p1Score := 0
p2Score := 0
%----------

%--POWER UP--

%The value in this variable will determine which ability
%the players will gain when their ball hits the power up
%ball. The value will be randomized once the power up is
%hit.

powerUp := 0
%------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END VARIABLES & INITIALIZATIONS %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%
% TITLE %
%%%%%%%%%

procedure title

    drawfillbox (0, 0, 639, 380, black)

    % K

    drawline (140, 340, 190, 340, red)
    drawline (190, 340, 140, 300, red)
    drawline (140, 300, 220, 340, red)
    drawline (220, 340, 200, 300, red)
    drawline (200, 300, 145, 280, red)
    drawline (145, 280, 180, 240, red)
    drawline (180, 240, 140, 240, red)
    drawline (140, 240, 125, 280, red)
    drawline (125, 280, 120, 240, red)
    drawline (120, 240, 80, 240, red)
    drawline (80, 240, 140, 340, red)

    drawfill (150, 330, brightred, red)

    % END K

    % I

    drawline (240, 310, 250, 310, red)
    drawline (250, 310, 240, 290, red)
    drawline (240, 290, 230, 290, red)
    drawline (230, 290, 240, 310, red)

    drawline (220, 280, 240, 280, red)
    drawline (240, 280, 220, 240, red)
    drawline (220, 240, 200, 240, red)
    drawline (200, 240, 220, 280, red)

    drawfill (240, 300, brightred, red)
    drawfill (220, 260, brightred, red)

    % END I

    % N

    drawline (260, 280, 320, 280, red)
    drawline (320, 280, 300, 240, red)
    drawline (300, 240, 280, 240, red)
    drawline (280, 240, 290, 260, red)
    drawline (290, 260, 270, 260, red)
    drawline (270, 260, 260, 240, red)
    drawline (260, 240, 240, 240, red)
    drawline (240, 240, 260, 280, red)

    drawfill (280, 270, brightred, red)

    % END N

    % G

    drawline (340, 280, 400, 280, red)
    drawline (400, 280, 360, 200, red)
    drawline (360, 200, 300, 200, red)
    drawline (300, 200, 310, 220, red)
    drawline (310, 220, 350, 220, red)
    drawline (350, 220, 360, 240, red)
    drawline (360, 240, 320, 240, red)
    drawline (320, 240, 340, 280, red)

    drawline (350, 270, 370, 270, red)
    drawline (370, 270, 360, 250, red)
    drawline (360, 250, 340, 250, red)
    drawline (340, 250, 350, 270, red)

    drawfill (380, 260, brightred, red)

    % END G

    % P

    drawline (340, 180, 420, 180, red)
    drawline (420, 180, 380, 120, red)
    drawline (380, 120, 340, 120, red)
    drawline (340, 120, 320, 80, red)
    drawline (320, 80, 280, 80, red)
    drawline (280, 80, 340, 180, red)

    drawline (360, 160, 380, 160, red)
    drawline (380, 160, 370, 140, red)
    drawline (370, 140, 350, 140, red)
    drawline (350, 140, 360, 160, red)

    drawfill (320, 120, brightred, red)

    % END P

    % O

    drawline (400, 120, 440, 120, red)
    drawline (440, 120, 420, 80, red)
    drawline (420, 80, 380, 80, red)
    drawline (380, 80, 400, 120, red)

    drawline (410, 110, 420, 110, red)
    drawline (420, 110, 410, 90, red)
    drawline (410, 90, 400, 90, red)
    drawline (400, 90, 410, 110, red)

    drawfill (400, 110, brightred, red)

    % END O


    % N

    drawline (460, 120, 520, 120, red)
    drawline (520, 120, 500, 80, red)
    drawline (500, 80, 480, 80, red)
    drawline (480, 80, 490, 100, red)
    drawline (490, 100, 470, 100, red)
    drawline (470, 100, 460, 80, red)
    drawline (460, 80, 440, 80, red)
    drawline (440, 80, 460, 120, red)

    drawfill (480, 110, brightred, red)

    %END N

    % G

    drawline (540, 120, 590, 120, red)
    drawline (590, 120, 560, 40, red)
    drawline (560, 40, 500, 40, red)
    drawline (500, 40, 510, 60, red)
    drawline (510, 60, 550, 60, red)
    drawline (550, 60, 560, 80, red)
    drawline (560, 80, 520, 80, red)
    drawline (520, 80, 540, 120, red)

    drawline (550, 110, 570, 110, red)
    drawline (570, 110, 560, 90, red)
    drawline (560, 90, 540, 90, red)
    drawline (540, 90, 550, 110, red)

    drawfill (580, 100, brightred, red)

    % END G

    % CROWN

    drawline (120, 180, 160, 140, red)
    drawline (160, 140, 180, 180, red)
    drawline (180, 180, 200, 140, red)
    drawline (200, 140, 240, 180, red)
    drawline (240, 180, 220, 100, red)
    drawline (220, 100, 140, 100, red)
    drawline (140, 100, 120, 180, red)

    drawfill (180, 120, yellow, red)

    % END CROWN

    % PONG

    drawoval (520, 260, 40, 40, red)

    drawfill (520, 260, white, red)

    % END PONG

end title

%%%%%%%%%%%%%
% END TITLE %
%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PROCESSES AND PROCEDURES %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

process p1Lose
    % This will be forked when Player 2 has scored on Player 1.
    % This will make the ball follow Player 1's paddle until
    % they shoot the ball.
    loop
	exit when xDirection > 0 or p1Score = maxScore or p2Score = maxScore
	ballY := p1Y
    end loop
end p1Lose

process p2Lose
    % This will be forked when Player 1 has scored on Player 2.
    % This will make the ball follow Player 2's paddle until
    % they shoot the ball.
    loop
	ballY := p2Y
	exit when xDirection < 0 or p1Score = maxScore or p2Score = maxScore
    end loop
end p2Lose

process generatePowerUp_1
    % This will be forked from the moment New Game is selected, until the
    % game ends. This will randomly spawn a power up ball every 10 seconds.
    % It's radius/size is adjustable by the user.
    loop

	exit when p1Score = maxScore or p2Score = maxScore
	randint (pUpX, 120, 530)
	randint (pUpY, 60, 320)
	drawfilloval (pUpX, pUpY, pUpSize, pUpSize, black)
	delay (10000)

	View.Update
	drawfilloval (pUpX, pUpY, pUpSize, pUpSize, brightgreen)

    end loop
end generatePowerUp_1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END PROCESSES AND PROCEDURES %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%
% MENU ITEMS %
%%%%%%%%%%%%%%

procedure newGame

    put ""
    drawfillbox (0, 0, 639, 380, black)
    colourback (black)
    colour (white)
    put "" : 29 ..
    put "KONG PONG NEW GAME"
    put ""
    put "Player 1, please enter your name. " ..
    get p1Name : *
    put "Player 2, please enter your name. " ..
    get p2Name : *

    % REINITIALIZE VARIABLES AND SCREEN
    cls
    colourback (white)
    colour (black)
    ballX := 320
    ballY := 190
    xDirection := initBallSpeed
    yDirection := initBallSpeed
    p1Y := 200
    p2Y := 200
    p1Size := initSize
    p2Size := initSize
    p1Speed := initSpeed
    p2Speed := initSpeed
    pUpSize := 10
    p1Score := 0
    p2Score := 0
    powerUp := 0
    %-----------------------------------

    setscreen ("offscreenonly")

    colourback (white)
    cls

    fork generatePowerUp_1

    loop

	% DECORATIONS AND BOUNDARIES

	drawline (0, 380, maxx, 380, black)     % Menu Line
	drawline (0, 340, maxx, 340, black)     % Boundaries (top)
	drawfill (10, 370, black, black)        % Fill Boundaries (top)
	drawline (0, 40, maxx, 40, black)       % Boundaries (bottom)
	drawfill (0, 0, black, black)           % Fill Boundaries (bottom)
	drawoval (0, 200, 75, 75, 255)          % Table decorations (left)
	drawfill (10, 200, green, black)        % Fill Table decorations (left)
	drawoval (maxx, 200, 75, 75, 255)       % Table decorations (right)
	drawfill (600, 200, green, black)       % Fill Table decorations (right)
	drawline (320, 40, 320, 340, 255)       % Table decorations (center)
	drawfill (0, 300, brightgreen, black)   % Fill the left table
	drawfill (600, 300, brightgreen, black) % Fill the right table

	%--CREATE BALL--
	drawfilloval (ballX, ballY, ballSize, ballSize, 0)
	%---------------

	%--CREATE PADDLES--
	drawfillbox (25, p1Y - p1Size, 40, p1Y + p1Size, brightred)
	% Creates Player 1's Paddle
	drawfillbox (600, p2Y - p2Size, 615, p2Y + p2Size, brightblue)
	% Creates Player 2's Paddle
	%------------------

	View.Update
	% This will refresh the screen so the image will not duplicate itself.

	drawfilloval (ballX, ballY, ballSize, ballSize, 0)
	% Removes Ball
	drawfillbox (25, p1Y - p1Size, 40, p1Y + p1Size, 0)
	% Removes Player 1's Paddle
	drawfillbox (600, p2Y - p2Size, 615, p2Y + p2Size, 0)
	% Removes Player 2's Paddle

	%%%%%%%%%%%%%%
	% BOUNDARIES %
	%%%%%%%%%%%%%%

	%--SCREEN BOUNDARY--

	if ballY > 340 - ballSize - 5 then
	    % If ball hit the top of the screen, bounce down
	    yDirection := -yDirection
	elsif ballY < 40 + ballSize + 5 then
	    % If ball hit the bottom of the screen, bounce up
	    yDirection := -yDirection
	end if

	%------------------

	%--PADDLE BOUNDARY--

	% Player 1

	if p1Y > 340 - p1Size - 5 then
	    % If the paddle is above or below the boundary, then force
	    % it to back in.
	    p1Y := 340 - p1Size - 5
	elsif p1Y < 40 + p1Size + 5 then
	    p1Y := 40 + p1Size + 5
	end if

	% Player 2

	if p2Y > 340 - p2Size - 5 then
	    % If the paddle is above or below the boundary, then force
	    % it to back in.
	    p2Y := 340 - p2Size - 5
	elsif p2Y < 40 + p2Size + 5 then
	    p2Y := 40 + p2Size + 5
	end if

	%-------------------

	%--PADDLE W/ BALL COLLISION--

	% This checks how the ball has hit the paddle, and will reflect
	% accordingly. When the ball is 5 pixels right of the paddle,it
	% will reflect. Depending on where the ball hits the paddle, the
	% ball will reflect differently.

	% Player 1

	% The xDirection has to be negative since the ball is going to
	% the left side when Player 1 is hitting it.

	if xDirection < 0 and ballX - ballSize <= 40 and ballY >= p1Y - p1Size
		and ballY <= p1Y - p1Size + 10 then % Most Bottom
	    xDirection := -xDirection
	    yDirection := -2
	elsif xDirection < 0 and ballX - ballSize <= 40 and ballY >= p1Y -
		p1Size + 10 and ballY <= p1Y - 2 then % Bottom
	    xDirection := -xDirection
	    yDirection := -1
	elsif xDirection < 0 and ballX - ballSize <= 40 and ballY >= p1Y - 2
		and ballY <= p1Y + 2 then % Center
	    xDirection := -xDirection
	    yDirection := 0
	elsif xDirection < 0 and ballX - ballSize <= 40 and ballY >= p1Y + 2
		and ballY <= p1Y + p1Size - 10 then % Top
	    xDirection := -xDirection
	    yDirection := 1
	elsif xDirection < 0 and ballX - ballSize <= 40 and ballY >= p1Y +
		p1Size - 10 and ballY <= p1Y + p1Size then % Most Top
	    xDirection := -xDirection
	    yDirection := 2
	end if

	% Player 2

	% The xDirection has to be positive since the ball is going to the
	% right side when Player 2 is hitting it.

	if xDirection > 0 and ballX + ballSize >= 600 and ballY >= p2Y - p2Size
		and ballY <= p2Y - p2Size + 10 then % Most Bottom
	    xDirection := -xDirection
	    yDirection := -2
	elsif xDirection > 0 and ballX + ballSize >= 600 and ballY >= p2Y -
		p2Size + 10 and ballY <= p2Y - 2 then % Bottom
	    xDirection := -xDirection
	    yDirection := -1
	elsif xDirection > 0 and ballX + ballSize >= 600 and ballY >= p2Y - 2
		and ballY <= p2Y + 2 then %Center
	    xDirection := -xDirection
	    yDirection := 0
	elsif xDirection > 0 and ballX + ballSize >= 600 and ballY >= p2Y + 2
		and ballY <= p2Y + p2Size - 10 then % Top
	    xDirection := -xDirection
	    yDirection := 1
	elsif xDirection > 0 and ballX + ballSize >= 600 and ballY >= p2Y +
		p2Size - 10 and ballY <= p2Y + p2Size then % Most Top
	    xDirection := -xDirection
	    yDirection := 2
	end if

	%----------------------------

	%--POWER UP COLLISION--

	% This will check if the ball has made contact with the Power Up ball.
	% An invisible boundary has been set up around the Power Up, and if any
	% part of the ball comes incontact with the Power Up, a random integer
	% will go into the variable powerUp, and the powerUp's ability comes
	% accordingly.

	% Player 1

	if xDirection > 0 and ballX <= pUpX + pUpSize + 5 and ballX >=
		pUpX - pUpSize - 5 and ballY <= pUpY + pUpSize + 5 and ballY >=
		pUpY - pUpSize - 5 then

	    drawfilloval (pUpX, pUpY, pUpSize, pUpSize, brightgreen)

	    pUpX := 0
	    pUpY := 0
	    randint (powerUp, 1, 3)
	    if powerUp = 1 then
		p2Size := initSize - 20
	    elsif powerUp = 2 then
		p1Size := initSize + 20
	    elsif powerUp = 3 then
		initBallSpeed := 10
	    end if

	elsif xDirection > 0 and pUpX <= ballX + ballSize + 5 and pUpX
		>= ballX - ballSize - 5 and pUpY <= ballY + ballSize + 5 and pUpY
		>= ballY - ballSize - 5 then

	    drawfilloval (pUpX, pUpY, pUpSize, pUpSize, brightgreen)
	    pUpX := 0
	    pUpY := 0
	    randint (powerUp, 1, 3)
	    if powerUp = 1 then
		p1Size := initSize - 20
	    elsif powerUp = 2 then
		p2Size := initSize + 20
	    elsif powerUp = 3 then
		initBallSpeed := 10
	    end if

	end if

	% Player 2

	if xDirection < 0 and ballX <= pUpX + pUpSize + 5 and
		ballX >= pUpX - pUpSize - 5 and ballY <= pUpY + pUpSize + 5 and
		ballY >= pUpY - pUpSize - 5 then

	    drawfilloval (pUpX, pUpY, pUpSize, pUpSize, brightgreen)
	    pUpX := 0
	    pUpY := 0
	    randint (powerUp, 1, 3)
	    if powerUp = 1 then
		p1Size := initSize - 20
	    elsif powerUp = 2 then
		p2Size := initSize + 20
	    elsif powerUp = 3 then
		xDirection := -10
	    end if
	elsif xDirection < 0 and pUpX <= ballX + ballSize + 5 and
		pUpX >= ballX - ballSize - 5 and pUpY <= ballY + ballSize + 5 and
		pUpY >= ballY - ballSize - 5 then

	    drawfilloval (pUpX, pUpY, pUpSize, pUpSize, brightgreen)
	    pUpX := 0
	    pUpY := 0
	    randint (powerUp, 1, 3)
	    if powerUp = 1 then
		p1Size := initSize - 20
	    elsif powerUp = 2 then
		p2Size := initSize + 20
	    elsif powerUp = 3 then
		xDirection := -10
	    end if

	end if

	%----------------------

	%--SCORE--

	% Player 1

	if ballX > 650 then
	    % Player 1 scores when ball hits edge of Player 2's screen
	    p1Score := p1Score + 1
	    % Player 1's score will increase by 1.
	    p1Size := initSize
	    % Both of the paddle's sizes reset.
	    p2Size := initSize
	    ballX := 595
	    % The ball's X Coordinate will be set infront of the paddle.
	    xDirection := 0
	    % The ball is motionless.
	    yDirection := 0
	    fork p2Lose
	    % This will let the ball's Y Coordinate be the same as the paddle
	    % until the player shoots the ball.

	    %Player 2

	elsif ballX < -20 then
	    % Player 2 Score when ball hits edge of Player 1's screen
	    p2Score := p2Score + 1
	    p1Size := initSize
	    p2Size := initSize
	    ballX := 45
	    xDirection := 0 %(1)
	    yDirection := 0
	    fork p1Lose

	end if

	%---------

	%%%%%%%%%%%%%%%%%%
	% END BOUNDARIES %
	%%%%%%%%%%%%%%%%%%


	%%%%%%%%%%%%%%
	% KEYSTROKES %
	%%%%%%%%%%%%%%

	Input.KeyDown (keys)

	% Player 1

	if keys ('w') then            % Move Paddle Up
	    p1Y := p1Y + p1Speed
	end if

	if keys ('s') then            % Move Paddle Down
	    p1Y := p1Y - p1Speed
	end if

	if keys ('f') then    % Fires the ball Right
	    if ballX = 45 then
		xDirection := initBallSpeed
	    end if
	end if

	% Player 2

	if keys (KEY_UP_ARROW) then
	    p2Y := p2Y + p2Speed
	end if

	if keys (KEY_DOWN_ARROW) then
	    p2Y := p2Y - p2Speed
	end if

	if keys ('0') then
	    if ballX = 595 then
		xDirection := -initBallSpeed
	    end if
	end if


	%%%%%%%%%%%%%%%%%%
	% END KEYSTROKES %
	%%%%%%%%%%%%%%%%%%


	%%%%%%%%%%%%%%%%%
	% BALL MOVEMENT %
	%%%%%%%%%%%%%%%%%

	ballX := ballX + xDirection
	ballY := ballY + yDirection

	%%%%%%%%%%%%%%%%%%%%%
	% END BALL MOVEMENT %
	%%%%%%%%%%%%%%%%%%%%%

	%--GAME SPEED--
	delay (3)

	%--SCORE BOARD--

	locatexy (20, 360)
	put "[ ", p1Name, " ]"

	locatexy (295, 360)
	colourback (black)
	colour (white)
	put p1Score, "" : 6, p2Score
	locatexy (520, 360)
	put "[ ", p2Name, " ]"

	if p1Score = maxScore then
	    cls
	    put "" : 35 ..
	    put "GAME OVER"
	    put ""
	    put p1Name, " is the winner."
	    locate (23, 27)
	    put "Press anykey to continue..." ..
	elsif p2Score = maxScore then
	    cls
	    put "" : 35 ..
	    put "GAME OVER"
	    put ""
	    put p2Name, " is the winner."
	    locate (23, 27)
	    put "Press anykey to continue..." ..
	end if
	%---------------

	exit when p1Score = maxScore or p2Score = maxScore

    end loop

    View.Set ("nooffscreenonly")

    pUpSize := 0 % This will prevent the power up from appearing on the screen.

    var ch : char := getchar            % Wait for input

    % REINITIALIZE SCREEN
    colourback (white)
    cls
    title
    %--------------------

end newGame

procedure settings

    cls

    drawfillbox (0, 0, 639, 380, black)

    put ""
    colourback (black)
    colour (white)
    put "" : 29 ..
    put "KING PONG SETTINGS"
    put ""
    put "Rounds: ", maxScore
    put "Size of Paddle (30 - 100): ", initSize
    put "Paddle's Speed (1 - 5): ", initSpeed
    put "Ball's Speed (1 - 5): ", initBallSpeed
    put ""
    put "How many rounds would you like to play? " ..
    get maxScore

    if maxScore < 1 then % PREVENTS GIGO
	maxScore := 1
    end if

    put ""
    put "What size of paddle do you want? " ..
    get initSize

    if initSize < 30 then
	initSize := 30
    elsif initSize > 100 then
	initSize := 100
    end if

    put ""
    put "What speed do you want? " ..
    get initSpeed

    if initSpeed < 1 then
	initSpeed := 1
    elsif initSpeed > 5 then
	initSpeed := 5
    end if

    put ""
    put "What ball speed do you want? " ..
    get initBallSpeed

    if initBallSpeed < 1 then
	initBallSpeed := 1
    elsif initBallSpeed > 5 then
	initBallSpeed := 5
    end if


    %--REINITIALIZE--
    colourback (white)
    colour (black)
    cls
    title
    %----------------
end settings

procedure quitGame
    GUI.Quit
end quitGame

procedure help
    cls
    drawfillbox (0, 0, 639, 380, black)
    put ""
    colourback (black)
    colour (white)
    put "" : 38 ..
    put "HELP"
    put ""
    put "The objective of this game is to use all of your strategic values in a ",
	"battle " 
    put "of wits against your opponent in a game of King Pong. You would ",
	"need to be able"
    put "to pinpoint the exact location of where the ball is ",
	"going to land and as well"
    put "as take your best guess at which angle you should hit the ball ",
	"at. One thing is"
    put "for certain in a game of King Pong. The man with the least will to win ",
	"will"
    put "lose."
    put ""
    
    put "":10, "OBJECTIVE: You must get the ball past your opponent's paddle."
    put ""
    
    put "":36, "CONTROLS"
    put "":10, "Player 1", "":45, "Player 2"
    put ""
    put "":10, "w - UP", "":42, "up arrow - UP"
    put "":10, "s - DOWN", "":36, "down arrow - DOWN"
    put "":10, "f - SERVE", "":36, "0 (Zero) - SERVE"
    
    locate (23, 27)
    put "Press anykey to continue..." ..
    var ch : char := getchar            % Wait for input
    colourback (white)
    colour (black)
    cls
    title
end help

procedure about
    cls
    drawfillbox (0, 0, 639, 380, black)
    put ""
    colourback (black)
    colour (white)
    put "" : 32 ..
    put "ABOUT KING PONG"
    put ""
    put "This game is not an official game. This game was not sponsored by Atari ",
	"Inc."
    put "team. This game was purely fanmade by a hardcore classic Pong fan."
    put ""
    locate (23, 27)
    put "Press anykey to continue..." ..
    var ch : char := getchar            % Wait for input
    colourback (white)
    colour (black)
    cls
    title
end about

procedure dummy
    %This procedure is here to fill in for the breaks in the menu.
end dummy

%%%%%%%%%%%%%%%%%%
% END MENU ITEMS %
%%%%%%%%%%%%%%%%%%

% Create the menus
fileMenu := GUI.CreateMenu ("File")

item (1) := GUI.CreateMenuItem (name (1), newGame)
item (2) := GUI.CreateMenuItem (name (2), settings)
item (3) := GUI.CreateMenuItem (name (3), dummy)
item (4) := GUI.CreateMenuItem (name (4), quitGame)

helpMenu := GUI.CreateMenu ("Help")

item (5) := GUI.CreateMenuItem (name (5), help)
item (6) := GUI.CreateMenuItem (name (6), dummy)
item (7) := GUI.CreateMenuItem (name (7), about)

title

loop
    exit when GUI.ProcessEvent
end loop

Window.Close (winID)
