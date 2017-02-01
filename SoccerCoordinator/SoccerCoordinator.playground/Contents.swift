// Soccer League Coordinator

/*----------------------------------------------------------------------------------------
Function: experienceOfTeam
Inputs: Team Array - players names
Outputs: Number of experienced players and inexperienced players
----------------------------------------------------------------------------------------*/

func experienceOfTeam(team currentTeam: [String]) -> (experienced: Int, inexperienced: Int)
{
    // Initialize variables
    
    var countExperienced = 0      //used to count how many experienced people are on the team
    var countInexperienced = 0    //used to count how many inexperienced people are on the team
    var playerInfo = [String]()   //used to store the array from players dictionary
    
    // Loop through all of the players on the team already to determine how many are experienced
    
    for player in currentTeam
    {
        // Obtain the stats of the player from the players dictionary and look at the experience stat
        
        playerInfo = players[player]!
        if playerInfo[1] == "YES"
        {
            countExperienced += 1
        }
        else
        {
            countInexperienced += 1
        }
    }
    
    return (countExperienced,countInexperienced)
}

/*----------------------------------------------------------------------------------------
Function: createTeamLetter
Inputs: teammate - players name, name - team name, date - date of the first practice
Outputs: customized letter to the guardians about first practice information.
----------------------------------------------------------------------------------------*/

func createTeamLetter(teammate currentTeammate: String, name teamName: String, date teamDate: String) -> String
{
    // Initialize variables
    
    var playerInfo = [String]() //used to store the array from players dictionary
    
    // Obtain the stats of the player from the players dictionary for the guardians name
    
    playerInfo = players[currentTeammate]!
    
    return "Dear \(playerInfo[2]),\r\n\r\nYour child \(currentTeammate) is on the team \(teamName). \r\nTheir first practice is on \(teamDate). \r\nWe look forward to seeing you soon!\r\n"
}

/*----------------------------------------------------------------------------------------
Initialize the list of players in a dictonary
KEY = Player Name
VALUE = Array of information [Height, Player Experience, Gaurdians Name]
----------------------------------------------------------------------------------------*/

let players: [String:[String]]  = [
    
    "Joe Smith": ["42", "YES", "Jim and Jan Smith"],
    "Jill Tanner": ["36", "YES", "Clara Tanner"],
    "Bill Bon": ["43", "YES", "Sara and Jenny Bon"],
    "Eva Gordon": ["45", "NO","Wendy and Mike Gordon"],
    "Matt Gill": ["40", "NO", "Charles and Sylvia Gill"],
    "Kimmy Stein": ["41", "NO", "Bill and Hillary Stein"],
    "Sammy Adams": ["45", "NO", "Jeff Adams"],
    "Karl Saygan": ["42", "YES","Heather Bledsoe"],
    "Suzane Greenberg": ["44", "YES", "Henrietta Dumas"],
    "Sal Dali": ["41", "NO", "Gala Dali"],
    "Joe Kavaller": ["39", "NO", "Sam and Elaine Kavaller"],
    "Ben Finkelstein": ["44", "NO", "Aaron and Jill Finkelstein"],
    "Diego Soto": ["41", "YES", "Robin and Sarlka Soto"],
    "Chloe Alaska": ["47", "NO", "David and Jamie Alaska"],
    "Arnold Willis": ["43", "NO", "Claire Willis"],
    "Phillip Helm": ["44", "YES", "Thomas Helm and Eva Jones"],
    "Les Clay": ["42", "YES", "Wynonna Brown"],
    "Herschel Krustofski": ["45", "YES", "Hyman and Rachel Krustofski"]
]

/*----------------------------------------------------------------------------------------
Initialize the team arrays
----------------------------------------------------------------------------------------*/

var teamSharks = [String]()
var teamDragons = [String]()
var teamRaptors = [String]()
var letters = [String]()

/*----------------------------------------------------------------------------------------
Assign players to the teams. Seperate them so the teams have an even amount of experienced
and inexperienced players.
----------------------------------------------------------------------------------------*/

for eachPlayer in players
{
    if teamSharks.count < players.count / 3
    {
        var teamExperience = experienceOfTeam(team: teamSharks)
        
        if teamExperience.0 != players.count / 3 / 2 || teamExperience.1 != players.count / 3 / 2
        {
            teamSharks.append(eachPlayer.0)
        }
    }
    else if teamDragons.count < players.count / 3
    {
        var teamExperience = experienceOfTeam(team: teamDragons)
        
        if teamExperience.0 != players.count / 3 / 2 || teamExperience.1 != players.count / 3 / 2
        {
            teamDragons.append(eachPlayer.0)
        }
    }
    else
    {
        teamRaptors.append(eachPlayer.0)
    }
}

/*----------------------------------------------------------------------------------------
Create the letters for the team members and their guardians saying when their first
practice will be.
----------------------------------------------------------------------------------------*/

for teammates in teamDragons
{
    letters.append(createTeamLetter(teammate: teammates, name: "Dragons", date: "March 17, at 1pm"))
}

for teammates in teamRaptors
{
    letters.append(createTeamLetter(teammate: teammates, name: "Raptors", date: "March 18, at 1pm"))
}

for teammates in teamSharks
{
    letters.append(createTeamLetter(teammate: teammates, name: "Sharks", date: "March 17, at 3pm"))
}

/*----------------------------------------------------------------------------------------
Print letters for review
----------------------------------------------------------------------------------------*/

for mail in letters
{
    print(mail)
}
