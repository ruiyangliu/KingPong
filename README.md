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
