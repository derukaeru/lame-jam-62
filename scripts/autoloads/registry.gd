extends Node

var UID: Dictionary = {
	"loading_screen": "uid://tetiuyj7kfoe",
	"splash_screen": "uid://b4ggbq71lpwo4",
	"title_screen": "uid://dix67ojrdr6ht",
	"pause_screen": "uid://7jemke30bxqq",
	"end_day_screen": "uid://bpsa3xpowqm02",
	"end_screen": "uid://bt5vwfj50ytso",
	"main": "uid://ciymvwvc32apb",
	
	"club_stamp": "uid://xhht0hei3d8v",
	"diamond_stamp": "uid://s45v8byw4uca",
	"heart_stamp": "uid://dd04lqi4s63qw",
	"spade_stamp": "uid://cat23bnw5fccq",
	
	"paper": "uid://cr10ay5yhae77",
	"guide": "uid://cf4uexday8p2d",
	"intro": "uid://5e1fa3r7v3jy"
}

var papers: Dictionary = {
	"tainted": {
		"bad_topic": [
			["Secret Mayor Deal", "Sources confirm Mayor Aldren signed a closed-door agreement with Veltro Industries last Tuesday. No public disclosure was made. City council members say they were not informed. Legal experts question whether proper procedure was followed. Citizens groups are demanding a full audit of the transaction."],
			["Missing Budget Funds", "An internal report suggests over 2 million in public funds remains unaccounted for this fiscal year. The finance ministry has not responded to requests for comment. Opposition lawmakers are calling for an independent investigation into the discrepancy before the next budget cycle begins."],
			["Press Blocked at Hearing", "Several journalists were denied entry to yesterday's municipal hearing on zoning reform. Officers cited a new internal policy restricting press credentials. No formal announcement was made to news organizations beforehand. The Press Freedom Coalition says this is the third such incident this month."],
			["Minister Owns Rival Firm", "Documents obtained by this paper show Minister Halvern holds a majority stake in Caldex Corp, a company that received three government contracts this year. The minister's office says there is no conflict of interest. Ethics watchdogs disagree and are filing a formal complaint this week."],
			["Election Data Altered", "A whistleblower inside the electoral commission claims voter registration records were modified ahead of last month's district elections. The commission denies any irregularities. Independent auditors have not been granted access to verify the original files. Calls for a recount are growing."],
		],
		"unnamed_sources": [
			["Mayor Is Destroying Us", "This city is being run into the ground and everyone knows it. The mayor's decisions over the past year have been nothing short of reckless. Residents deserve better than this kind of leadership. It is time for the people of Creston to demand accountability before things get any worse than they already are."],
			["Transit Plan Will Fail", "The new transit expansion is a disaster waiting to happen. Anyone who has used Route 7 knows the infrastructure cannot handle more load. Throwing money at this problem is not a solution. The city council should be ashamed of approving a plan this poorly thought out without proper public consultation."],
			["Veltro Must Be Stopped", "Veltro Industries has no business operating in this city. Their track record elsewhere speaks for itself and residents should be outraged that officials continue to welcome them. This is not about jobs or development. This is about a company that puts profit above everything including the safety of our neighborhoods."],
			["Schools Are Beyond Saving", "Creston's public schools have collapsed under years of neglect and no amount of budget patches will fix it. Parents who can leave already have. The ones left behind deserve honesty, not press releases. The education ministry has failed an entire generation and nobody in power seems to care enough to say it."],
			["The Market Is Rigged", "Small business owners in this city are fighting a losing battle and the deck is stacked against them deliberately. Procurement contracts go to the same names every single time. If you are not connected you do not stand a chance. This is not capitalism, this is a closed club with a city budget behind it."],
		],
		"banned_words": [
			["Unrest in East Ward", "Protest marches continued into the night in East Ward as residents voiced anger over the proposed factory expansion. Riot barriers were erected near the community center. Police described the situation as volatile. Organizers insist demonstrations have remained peaceful despite the heavy officer presence."],
			["Riot Feared at Stadium", "Authorities deployed additional officers ahead of Saturday's match after intelligence suggested organized unrest among rival supporter groups. Club officials urged calm. City transport warned commuters to avoid the area during evening hours as tensions remained high around the venue."],
			["Shut Down by Police", "A planned protest outside the ministry building was dispersed before it began. Officers cited an unpermitted assembly. Organizers say the permit was filed correctly and rejected without reason. The scene turned tense briefly but no arrests were made. A second protest is being planned."],
			["Unrest After Verdict", "Following the acquittal of a prominent businessman on fraud charges, unrest broke out near the courthouse. Several windows were broken. Police used crowd control measures. Legal observers say public anger stems from broader distrust of the justice system after a series of controversial rulings."],
			["Workers Protest Wage Cuts", "Hundreds of factory workers staged a protest outside Veldra Manufacturing after the company announced a 15 percent wage reduction. Union leaders called it an act of aggression. Riot police were stationed nearby as a precaution. Management says cuts are necessary to stay solvent."],
		],
		"foreign": [
			["Neighbor Rejects Deal", "The Eastholm parliament voted 61 to 44 against the proposed bilateral trade agreement citing unfavorable tariff terms. Our trade minister expressed disappointment. Analysts say this sets back regional economic cooperation by at least two years. Renegotiation talks have not been scheduled."],
			["Country Border Tensions", "Armed units from Varnec have moved closer to the northern border according to satellite imagery reviewed by regional analysts. No shots have been fired. Diplomatic channels remain open but strained. The foreign ministry issued a statement urging restraint and calling for multilateral dialogue."],
			["Refugee Numbers Surge", "The Kellian border post recorded over 4,000 crossings this week, the highest single-week figure in three years. Aid organizations say resources are critically strained. The government has not announced additional support. International bodies are urging an emergency response before conditions worsen."],
			["International Vote Disputed", "Opposition leaders in Aldovar are refusing to accept preliminary results from Sunday's national vote. International observers flagged irregularities at several polling stations. The ruling party claims a decisive victory. Protests have formed outside the capital's electoral commission building."],
			["Foreign Press Banned", "The Drev government announced a full suspension of foreign media credentials effective immediately. No reason was given officially. Journalists from four countries were escorted out of the capital yesterday. Press freedom organizations are calling it one of the most severe crackdowns seen this decade."],
		],
		"by_reporter": [
			["Waste Contract Questioned", "The city's new waste management contract raises serious questions. The winning bid came from a firm registered just six weeks before the tender opened. Reporter Carter obtained internal emails suggesting evaluation criteria were changed after bids were submitted. Officials have declined all comment."],
			["Evictions After Complaint", "Three families in the Dunmore district received eviction notices the same week they filed complaints against a firm with ties to the deputy mayor. Reporter Carter spoke to each family separately. Their accounts are consistent. The deputy mayor's office called the connection coincidental."],
			["Contracts Repeat Vendors", "A pattern is emerging in how the city awards emergency repair contracts. Reporter Carter analyzed 40 contracts over two years and found 34 went to the same four vendors without open bidding. The procurement office says emergency exemptions allow this. Critics say the exemptions are being abused."],
			["Cameras Installed Quietly", "Surveillance cameras were installed in the Pelwick community center without resident consultation or council vote. Reporter Carter reviewed meeting minutes going back eight months and found no record of approval. The installation company is owned by a relative of a sitting council member."],
			["Lab Funds Redirected", "Students at Graymoor Secondary have gone without science lab equipment for two full semesters. The replacement budget was approved last year. Reporter Carter traced the funds and found they were reallocated to a school in the district represented by the education minister himself."],
		],
	},
	"clean": [
		["New Park Opens", "The city unveiled Halvern Green yesterday, a two-acre public park built on a former vacant lot. The project took eighteen months to complete. It features walking paths, a small fountain, and seating areas. Families gathered for the opening ceremony. Officials say more green space projects are planned for next year."],
		["Bakery Wins Top Award", "Creston's own Mira Polden took first place at the Regional Bakers Cup held in the capital last weekend. Her entry was a layered honey cake with cardamom cream. Polden has run her bakery on Ferrow Street for eleven years. She plans to add the winning recipe to her regular menu next month."],
		["School Choir Places 2nd", "Students from Dunmore Primary came in second place at the National Youth Choir Festival. Forty-two schools participated. The choir performed two original arrangements. Director Lena Avro says the students practiced every morning before class for three months. A celebratory concert is planned for parents next Friday."],
		["Bus Route to Oakfen", "City transit announced an extension of Route 7 to cover the Oakfen residential area starting next Monday. The extension adds four new stops. Residents had requested the change for over two years. The route will run every twenty minutes during peak hours and every forty minutes in the evenings."],
		["Library Wing Now Open", "The Central Public Library opened its expanded reading wing today after a year of renovations. The new space adds 200 seats and a dedicated children's section. Funding came from city budget and private donations. Borrowing numbers have already increased 30 percent since construction began."],
		["Farmers Market", "The Creston seasonal farmers market opens this Saturday at Bound Square for the first time since winter. Over 30 vendors will be present selling produce, preserves, and handmade goods. Hours are 7am to 1pm. Two new vendors specializing in local honey and fresh herbs are joining this season."],
		["Community Pool Reopens", "After repairs to the filtration system were completed ahead of schedule, the Westfield Community Pool will reopen this Thursday, two weeks earlier than planned. Admission remains unchanged. Summer swim lessons are still accepting registrations. The pool deck has also been resurfaced as part of the work."],
		["Shelter Needs Volunteers", "The Creston Animal Shelter is looking for weekend volunteers to help walk and socialize dogs ahead of an adoption event next month. No experience is required. Applicants must be 16 or older. The shelter currently has 47 dogs available for adoption. Register at the shelter's front desk."],
		["City Hall Murals", "Artist Davan Reyes has completed a large mural on the east wall of City Hall commissioned earlier this year. The piece depicts the city's history from its founding through the present. It took four months to finish. Reyes says it is the largest work of his career. Viewing is open during building hours."],
		["Record Cleanup Turnout", "Over 300 residents participated in last weekend's annual city cleanup drive, the highest turnout in twelve years. Volunteers collected waste across 14 districts. The parks department says 8 tons of trash were removed in a single morning. Organizers are already planning next year's event with expanded coverage."],
	]
}

var guide: Array = [
	["1. Remove all articles with a Club stamp.", ""],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning Government", ""],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning Government \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Remove papers based on opinions", ""],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning Government \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Remove papers based on opinions", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning Government \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Remove papers based on opinions", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning Government \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Remove papers based on opinions", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n7. Override all rules preceding if paper has Spade stamp.\n"],
	["1. Remove all articles with a Club stamp.\n2. Remove any article mentioning Government \n3. Ignore Rule 1 if paper has a diamond stamp\n4. Remove papers based on opinions", 
	"5. Papers with \"riot\", \"protest\", or \"unrest\" are banned.\n6. Foreign articles require a Heart stamp.\n7. Override all rules preceding if paper has Spade stamp.\n8. Remove any article  by Reporter (name). No Exceptions."],
]
