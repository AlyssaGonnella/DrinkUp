CREATE TABLE Users(
	userID CHAR(64) PRIMARY KEY,
	password CHAR(64)
);

CREATE TABLE Party(
	partyID CHAR(32) PRIMARY KEY,
	partyDate DATE,
	location CHAR(64),
	name CHAR(64)
);

CREATE TABLE Drink(
	drinkID INT(32) PRIMARY KEY,
	name CHAR(64),
	instructions VARCHAR(512)
);

CREATE TABLE Ingredient(
	name CHAR(64) PRIMARY KEY
);

CREATE TABLE Flight(
	flightID INT(32) PRIMARY KEY,
	numberOfDrinks INT
);

CREATE TABLE Attending(
	userID CHAR(32),
	partyID CHAR(32),
	PRIMARY KEY (userID, partyID),
	FOREIGN KEY (userID) REFERENCES Users (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (partyID) REFERENCES Party (partyID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE LikedBy(
	userID CHAR(32),
	drinkID INT(32),
	PRIMARY KEY (userID, drinkID),
	FOREIGN KEY (userID) REFERENCES Users (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (drinkID) REFERENCES Drink (drinkID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE InPantry(
	userID CHAR(32),
	name CHAR(64),
	PRIMARY KEY (userID, name),
	FOREIGN KEY (userID) REFERENCES Users (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY	(name) REFERENCES Ingredient (name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IngredientOf(
	drinkID INT(32),
	quantity CHAR(32),
	name CHAR(32),
	PRIMARY KEY (drinkID, name),
	FOREIGN KEY (drinkID) REFERENCES Drink (drinkID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (name) REFERENCES Ingredient (name)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE InFlight(
	drinkID INT(32),
	flightID INT(32),
	PRIMARY KEY (drinkID, flightID),
	FOREIGN KEY (drinkID) REFERENCES Drink (drinkID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (flightID) REFERENCES Flight (flightID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Serving(
	flightID INT(32),
	partyID CHAR(32),
	PRIMARY KEY (flightID, partyID),
	FOREIGN KEY (flightID) REFERENCES Flight (flightID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (partyID) REFERENCES Party (partyID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

INSERT INTO Drink VALUES (1, '6am Sunrise', 'Fill high-ball glass with ice, Pour in Mt Dew and gin, then stir. Then add the grenadine. Do not stir');
INSERT INTO Drink VALUES (2, 'Abbey Cocktail', 'Shake all ingredients (except for the cherry) with ice and strain into a cocktial glass. Top with cherry and serve.');
INSERT INTO Drink VALUES (3, 'Adios Mother', 'Fill hurricane gass with ice: add vodka, gin, white rum, blue curacao. Fill glass with equal parts sour mix and 7-up. Garnish with a cherry');
INSERT INTO Drink VALUES (4, 'Alaska Cocktail', 'Stir all ingredients with ice, strain contents into a cocktail glass. Drop in a twist of lemon and serve');
INSERT INTO Drink VALUES (5, 'Anglers Cocktail', 'Shake all ingredients with cracked ice, pour contents into an old-fashioned glass over ice cubs, and serve');
INSERT INTO Drink VALUES (6, 'AT&T', 'Pour vodka over gin and ice, add tonic and stir.');
INSERT INTO Drink VALUES (7, 'Barrier Reef', 'Blend');
INSERT INTO Drink VALUES (8, 'Barton Special', 'Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes and serve');
INSERT INTO Drink VALUES (9, 'Bermuda Highball', 'Pour brandy, gin and dry vermouth into a highball glass over ice cubes. Fill with carbonated water and stir. Add the twist of lemon and serve (may also sub ginger ale for carbonated water).');
INSERT INTO Drink VALUES (10, 'Bloody Sun', 'Put ingredients into shaker and shake well. Pour to the glass filled with ice cubes');
INSERT INTO Drink VALUES (11, 'Blue in the Face', 'Fill glass half full with ice. Add Liquors. Add sugar and tonic to taste. Stir');
INSERT INTO Drink VALUES (12, 'Casino Cocktail', 'Shake all ingredients (except cherry) with ice and strain into cocktail glass. Add cherry on top and serve');
INSERT INTO Drink VALUES (13, 'Deep Valley', 'Starting by the gin and the blue curacao and finishing with the soda, mix directly into a collins glass filled with ice. Garnish with a long lemon twist, a cherry, and mint leaves');
INSERT INTO Drink VALUES (14, 'Earthquake Cocktail', 'Shake with ice and straing into Collins glass');
INSERT INTO Drink VALUES (15, 'Emerson', 'Shake all ingredients with ice, strain into a cocktail glass, and serve');
INSERT INTO Drink VALUES (16, 'Grass Skirt', 'In a shaker half-filled with ice cube, combine the gin, triple sec, pineapple juice, and grenadine. Shake well. Pour into an old-fashioned glass and garnish with pineapple slice');
INSERT INTO Drink VALUES (17, 'Hudson', 'Pour together and stir as required');
INSERT INTO Drink VALUES (18, 'Lost Cause', 'Pour Malibu. Gin, and lime juice over ice. Stir in club soda');
INSERT INTO Drink VALUES (19, 'Martinet', 'Pour all ingredients into a shaker full of ice. Stir or shake. Strain into a chilled cocktail glass.');
INSERT INTO Drink VALUES (20, 'Martini', 'In mixing glass half full with ice cubes, combine the gin and vermouth. Stir well. Strain into cocktail glass. Garnish with a lemon twist or an olive.');
INSERT INTO Drink VALUES (21, 'Barbary Coast', 'Shake all ingredients with ice, strain into a cocktail glass, and serve');
INSERT INTO Drink VALUES (22, 'Georgia Peach Iced Tea', 'Fill collins glass with ice, add Vodka, Gin, and Rum. Fill with sweet and sour. Pour peach schnapps on top');
INSERT INTO Drink VALUES (23, 'Holy Doodle', 'Add ingredients, stir, and serve');
INSERT INTO Drink VALUES (24, 'Jamaican Juice', 'In glass with ice, stir together ingredients');
INSERT INTO Drink VALUES (25, 'Pink n Tart', 'Shake with ice and strain into cocktail glass');
INSERT INTO Drink VALUES (26, 'Knockout Punch', 'Pour ingredients together and mix well');
INSERT INTO Drink VALUES (27, 'Rum Swizzle', 'Disolve powdered sugar in mix of 2 oz carbonated water and juice of lime in collins glass. Gill with ice and stir. Add bitters and rum. Fill with carbonated water, stir, and serve with a swizzle stick');
INSERT INTO Drink VALUES (28, 'Texas rose', 'Mix all ingredients and pour over ice.');
INSERT INTO Drink VALUES (29, 'Think pink', 'Put ingredients into cold glass, stir well');
INSERT INTO Drink VALUES (30, 'Whippersnapper', 'Add ingredients and stir.');
INSERT INTO Drink VALUES (31, 'Tropical Passion', 'Shake with ice and strain into shot glass');
INSERT INTO Drink VALUES (32, 'The Dire', 'Pour tonic waer and rum equally over ice, and add a splash of orange juice and a lime');
INSERT INTO Drink VALUES (33, '360 Degrees', 'Pour two of each ingredient in a shot glass them use a coster to put on shot over the top of one another');
INSERT INTO Drink VALUES (34, 'Alabama Riot', 'Pour fruit punch and ice into a glass, add southern comfort, peppermint schnapps and vodka. Stir. Finish with lime juice');
INSERT INTO Drink VALUES (35, 'Alley Shooter', 'Pour all ingredients over ice and mix together. Strain into glass and take as shot');
INSERT INTO Drink VALUES (36, 'Beer Breezer', 'Add freezer chilled vodka to frosted glass, ass tabasco and celery salt, top up with very cold very strong lager');
INSERT INTO Drink VALUES (37, 'Bloody Biker', 'Combine all ingredients in a shaker and shake until well blended. Pour over ice in old fashion glass.');
INSERT INTO Drink VALUES (38, 'Bomb', 'Mix all 5 shots in chilled glass, chug!');
INSERT INTO Drink VALUES (39, 'Cable Guice', 'Mix and pour over ice in tall glass');
INSERT INTO Drink VALUES (40, 'Danini', 'Add vodka, then lime juice, top up glass with coke');
INSERT INTO Drink VALUES (41, 'Flying Tiger', 'Fill glass with ice: add vodka, crème de menthe, and galliano. Top off glass with orange juice');
INSERT INTO Drink VALUES (42, 'Fruity Pebble', 'Shake with ice. Makes a great shooter or pour over rocks');
INSERT INTO Drink VALUES (43, 'Greenland', 'Shake over ice, strain into a highball glass. Top with fresh orange juice. Garnish with orange, cherry, mint leaf, and straws.');
INSERT INTO Drink VALUES (44, 'Hot spot', 'Mix vodka and tequila. Pour in Tabasco sauce until its very red');
INSERT INTO Drink VALUES (45, 'Alamo splash', 'Mix with cracked ice and strain into collins glass');
INSERT INTO Drink VALUES (46, 'Boomer', 'Blend, add ice, strain');
INSERT INTO Drink VALUES (47, 'Crowbar', 'Shake ingredients and strain over ice');
INSERT INTO Drink VALUES (48, 'GTV', 'The ingredients are best preserved cold for this purpose. To mix, just pour the ingredients into a glass. Add the ice cube, if you like');
INSERT INTO Drink VALUES (49, 'Lolita', 'Shake and strain into a cocktail glass and add one or two ice cubes');
INSERT INTO Drink VALUES (50, 'Mexican Rose', 'Shake and strain into glass or blend');
INSERT INTO Drink VALUES (51, 'Muppet', 'With shot glass, pour half glass tequila and other half with 7-up. Take glass already filled with both, take it with palm holdign top of glass and you hit to table so it will stir, drink whole');
INSERT INTO Drink VALUES (52, 'Pukerita', 'Combine ingredients and shake in tall glass with ice');
INSERT INTO Drink VALUES (53, 'White Bull', 'Pour ice into glass, add tequila and kahlua, fill with cream, shake and serve');
INSERT INTO Drink VALUES (54, 'Be Sweet', 'Add a few ice cubes and fill the glass with ginger ale');
INSERT INTO Drink VALUES (55, 'Dew', 'Mix together, do not shake, and enjoy');
INSERT INTO Drink VALUES (56, 'Hot damn', 'Shake all ingredients adding less or more orange juice for your preferance of taste. Serve in shot glass');
INSERT INTO Drink VALUES (57, 'Neuralizer', 'Mix all ingredients into highball glass, add ice if desired');
INSERT INTO Drink VALUES (58, 'Whiskey Sour Old-Fashioned', 'Mix whiskey, bittersm and cherry juice in a ice-filled cocktail glass, and fill remaining glass with sour. Garnish with olives');
INSERT INTO Drink VALUES (59, 'Richie Family', 'Mix vodka, whickey and Baileys, add the coffee and brown sugar. Blend');
INSERT INTO Drink VALUES (60, 'Ruby slipper', 'Fill shot glass 3/4 full of whiskey and then top off the shot with grenadine. Fill any large glass with 7-up. Drop the shot glass into the 7-up and then chug the entire mix');

INSERT INTO Ingredient VALUES ('Gin');
INSERT INTO Ingredient VALUES ('Rum');
INSERT INTO Ingredient VALUES ('Vodka');
INSERT INTO Ingredient VALUES ('Tequila');
INSERT INTO Ingredient VALUES ('Sweet Vermouth');
INSERT INTO Ingredient VALUES ('Brandy');
INSERT INTO Ingredient VALUES ('Dry Vermouth');
INSERT INTO Ingredient VALUES ('ice');
INSERT INTO Ingredient VALUES ('Mt Dew');
INSERT INTO Ingredient VALUES ('Grenadine');
INSERT INTO Ingredient VALUES ('Orange bitters');
INSERT INTO Ingredient VALUES ('Orange juice');
INSERT INTO Ingredient VALUES ('Cherry');
INSERT INTO Ingredient VALUES ('White Rum');
INSERT INTO Ingredient VALUES ('Blue curacao');
INSERT INTO Ingredient VALUES ('Sour mix');
INSERT INTO Ingredient VALUES ('7-Up');
INSERT INTO Ingredient VALUES ('Yellow chartreuse');
INSERT INTO Ingredient VALUES ('Lemon peel twist');
INSERT INTO Ingredient VALUES ('Bitters');
INSERT INTO Ingredient VALUES ('Tonic water');
INSERT INTO Ingredient VALUES ('Cointreau');
INSERT INTO Ingredient VALUES ('Vanilla ice-cream');
INSERT INTO Ingredient VALUES ('Applejack');
INSERT INTO Ingredient VALUES ('Scotch');
INSERT INTO Ingredient VALUES ('Carbonated water');
INSERT INTO Ingredient VALUES ('Orange liqueur');
INSERT INTO Ingredient VALUES ('Sugar');
INSERT INTO Ingredient VALUES ('Maraschino liqueur');
INSERT INTO Ingredient VALUES ('Lemon juice');
INSERT INTO Ingredient VALUES ('Pineapple juice');
INSERT INTO Ingredient VALUES ('Soda water');
INSERT INTO Ingredient VALUES ('Bourbon');
INSERT INTO Ingredient VALUES ('Absinthe');
INSERT INTO Ingredient VALUES ('Lime jucie');
INSERT INTO Ingredient VALUES ('Triple sec');
INSERT INTO Ingredient VALUES ('Peach schnapps');
INSERT INTO Ingredient VALUES ('Malibu rum');
INSERT INTO Ingredient VALUES ('Club soda');
INSERT INTO Ingredient VALUES ('Vermouth');
INSERT INTO Ingredient VALUES ('Crème de Cacao');
INSERT INTO Ingredient VALUES ('Light cream');
INSERT INTO Ingredient VALUES ('Sweet and sour mix');
INSERT INTO Ingredient VALUES ('Kahlua');
INSERT INTO Ingredient VALUES ('Fresca');
INSERT INTO Ingredient VALUES ('Grapefruit juice');
INSERT INTO Ingredient VALUES ('Hawaiian Punch');
INSERT INTO Ingredient VALUES ('Powdered sugr');
INSERT INTO Ingredient VALUES ('Crème de Banana');
INSERT INTO Ingredient VALUES ('Passoa');
INSERT INTO Ingredient VALUES ('Sprite');
INSERT INTO Ingredient VALUES ('Maui');
INSERT INTO Ingredient VALUES ('Grape juice');
INSERT INTO Ingredient VALUES ('Southern Comfort');
INSERT INTO Ingredient VALUES ('Peppermint schnapps');
INSERT INTO Ingredient VALUES ('Baileys');
INSERT INTO Ingredient VALUES ('Amaretto');
INSERT INTO Ingredient VALUES ('Hazelnut Schnapps');
INSERT INTO Ingredient VALUES ('Beer');
INSERT INTO Ingredient VALUES ('Tabasco');
INSERT INTO Ingredient VALUES ('Celery salt');
INSERT INTO Ingredient VALUES ('V8 juice');
INSERT INTO Ingredient VALUES ('Worcertershire');
INSERT INTO Ingredient VALUES ('Pepper sauce');
INSERT INTO Ingredient VALUES ('Olive juice');
INSERT INTO Ingredient VALUES ('Cinnamon schnapps');
INSERT INTO Ingredient VALUES ('Mango juice');
INSERT INTO Ingredient VALUES ('Coca-cola');
INSERT INTO Ingredient VALUES ('Galliano');
INSERT INTO Ingredient VALUES ('Crème de Menthe');
INSERT INTO Ingredient VALUES ('Milk');
INSERT INTO Ingredient VALUES ('Egg white');
INSERT INTO Ingredient VALUES ('Lemon-lime soda');
INSERT INTO Ingredient VALUES ('Whiskey');
INSERT INTO Ingredient VALUES ('151 proof rum');
INSERT INTO Ingredient VALUES ('Honey');
INSERT INTO Ingredient VALUES ('Angostura bitters');
INSERT INTO Ingredient VALUES ('Strawberry schnapps');
INSERT INTO Ingredient VALUES ('Cream');
INSERT INTO Ingredient VALUES ('Apple Sour pucker');
INSERT INTO Ingredient VALUES ('Parfait dAmour');
INSERT INTO Ingredient VALUES ('Ginger ale');
INSERT INTO Ingredient VALUES ('Cherry juice');
INSERT INTO Ingredient VALUES ('Brown sugar');

INSERT INTO IngredientOf VALUES (1, '9 oz', 'Mt Dew');
INSERT INTO IngredientOf VALUES (1, '3 oz', 'Gin');
INSERT INTO IngredientOf VALUES (1, '1 tblsp', 'Grenadine');
INSERT INTO IngredientOf VALUES (2, '1.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (2, '.25 oz', 'Orange bitters');
INSERT INTO IngredientOf VALUES (2, '4 oz', 'Orange jucie');
INSERT INTO IngredientOf VALUES (2, '1', 'cherry');
INSERT INTO IngredientOf VALUES (3, '1 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (3, '1 oz', 'Gin');
INSERT INTO IngredientOf VALUES (3, '1 oz', 'White rum');
INSERT INTO IngredientOf VALUES (3, '1 oz', 'Blue curacao');
INSERT INTO IngredientOf VALUES (3, '6 oz', 'Sour mix');
INSERT INTO IngredientOf VALUES (3, '6 oz', '7-Up');
INSERT INTO IngredientOf VALUES (4, '.5 oz', 'Orange bitters');
INSERT INTO IngredientOf VALUES (4, '1.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (4, '.75 oz', 'Yellow chartreuse');
INSERT INTO IngredientOf VALUES (4, '1', 'Lemon peel twist');
INSERT INTO IngredientOf VALUES (5, '1.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (5, '.25 oz', 'Grenadine');
INSERT INTO IngredientOf VALUES (5, '.5 oz', 'Bitters');
INSERT INTO IngredientOf VALUES (5, '.75 oz', 'Orange bitters');
INSERT INTO IngredientOf VALUES (6, '1 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (6, '1 oz', 'Gin');
INSERT INTO IngredientOf VALUES (6, '4 oz', 'Tonic water');
INSERT INTO IngredientOf VALUES (7, '3 oz', 'Gin');
INSERT INTO IngredientOf VALUES (7, '1 oz', 'Cointreau');
INSERT INTO IngredientOf VALUES (7, '4 oz', 'Vanilla ice-cream');
INSERT INTO IngredientOf VALUES (8, '.5 oz', 'Applejack');
INSERT INTO IngredientOf VALUES (8, '.25 oz', 'Gin');
INSERT INTO IngredientOf VALUES (8, '.25 oz', 'Scotch');
INSERT INTO IngredientOf VALUES (9, '.75 oz', 'Brady');
INSERT INTO IngredientOf VALUES (9, '.75 oz', 'Gin');
INSERT INTO IngredientOf VALUES (9, '.75 oz', 'Dry Vermouth');
INSERT INTO IngredientOf VALUES (9, '1', 'Lemon peel twist');
INSERT INTO IngredientOf VALUES (9, '4 oz', 'Carbonated water');
INSERT INTO IngredientOf VALUES (10, '2 oz', 'Gin');
INSERT INTO IngredientOf VALUES (10, '2 oz', 'Orange liqueur');
INSERT INTO IngredientOf VALUES (10, '1 oz', 'Cointreau');
INSERT INTO IngredientOf VALUES (10, '5 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (11, '1 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (11, '1 oz', 'Gin');
INSERT INTO IngredientOf VALUES (11, '1 oz', 'White rum');
INSERT INTO IngredientOf VALUES (11, '.25 oz', 'Sugar');
INSERT INTO IngredientOf VALUES (11, '3 oz', 'Tonic water');
INSERT INTO IngredientOf VALUES (12, '2 oz', 'Gin');
INSERT INTO IngredientOf VALUES (12, '.25 oz', 'Maraschino liqueur');
INSERT INTO IngredientOf VALUES (12, '.25 oz', 'Lemon juice');
INSERT INTO IngredientOf VALUES (12, '.5 oz', 'Orange bitters');
INSERT INTO IngredientOf VALUES (12, '1', 'Cherry');
INSERT INTO IngredientOf VALUES (13, '3 oz', 'Gin');
INSERT INTO IngredientOf VALUES (13, '2 oz', 'Blue curacao');
INSERT INTO IngredientOf VALUES (13, '1 oz', 'Lemon juice');
INSERT INTO IngredientOf VALUES (13, '4 oz', 'Pineapple juice');
INSERT INTO IngredientOf VALUES (13, '5 oz', 'Soda water');
INSERT INTO IngredientOf VALUES (14, '1 oz', 'Gin');
INSERT INTO IngredientOf VALUES (14, '1 oz', 'Bourbon');
INSERT INTO IngredientOf VALUES (14, '.75 oz', 'Absinthe');
INSERT INTO IngredientOf VALUES (15, '1 oz', 'Sweet Vermouth');
INSERT INTO IngredientOf VALUES (15, '1.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (15, '2 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (15, '.25 oz', 'Maraschino liqueur');
INSERT INTO IngredientOf VALUES (16, '1.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (16, '1 oz', 'Triple sec');
INSERT INTO IngredientOf VALUES (16, '1 oz', 'Pineapple juice');
INSERT INTO IngredientOf VALUES (16, '.5 oz', 'Grenadine');
INSERT INTO IngredientOf VALUES (17, '1 oz', 'Peach schnapps');
INSERT INTO IngredientOf VALUES (17, '.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (18, '1 oz', 'Malibu rum');
INSERT INTO IngredientOf VALUES (18, '1 oz', 'Gin');
INSERT INTO IngredientOf VALUES (18, '1 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (18, '4 oz', 'Club soda');
INSERT INTO IngredientOf VALUES (19, '3 oz', 'Gin');
INSERT INTO IngredientOf VALUES (19, '1.5 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (19, '.25 oz', 'Vermouth');
INSERT INTO IngredientOf VALUES (20, '2.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (20, '.25 oz', 'Dry Vermouth');
INSERT INTO IngredientOf VALUES (20, '1', 'Lemon peel twist');
INSERT INTO IngredientOf VALUES (21, '.5 oz', 'Scotch');
INSERT INTO IngredientOf VALUES (21, '.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (21, '.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (21, '.5 oz', 'Crème de Cacao');
INSERT INTO IngredientOf VALUES (21, '.5 oz', 'Light cream');
INSERT INTO IngredientOf VALUES (22, '.5 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (22, '.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (22, '.5 oz', 'Peach schnapps');
INSERT INTO IngredientOf VALUES (22, '4 oz', 'Sweet and sour mix');
INSERT INTO IngredientOf VALUES (22, '.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (23, '1 oz', 'Rum');
INSERT INTO IngredientOf VALUES (23, '1 oz', 'Kahlua');
INSERT INTO IngredientOf VALUES (23, '4 oz', 'Fresca');
INSERT INTO IngredientOf VALUES (24, '2 oz', 'Rum');
INSERT INTO IngredientOf VALUES (24, '5 oz', 'Grapefruit jucie');
INSERT INTO IngredientOf VALUES (25, '8 oz', 'Hawaiian Punch');
INSERT INTO IngredientOf VALUES (25, '1.5 oz', 'Tequlia');
INSERT INTO IngredientOf VALUES (25, '1.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (26, '1.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (26, '.25 oz', 'Lemon juice');
INSERT INTO IngredientOf VALUES (26, '.25 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (26, '.25 oz', 'Grenadine');
INSERT INTO IngredientOf VALUES (27, '2 oz', 'Rum');
INSERT INTO IngredientOf VALUES (27, '4 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (27, '1 tsp', 'Powdered sugar');
INSERT INTO IngredientOf VALUES (27, '.5 oz', 'Bitters');
INSERT INTO IngredientOf VALUES (27, '6 oz', 'Carbonated water');
INSERT INTO IngredientOf VALUES (28, '1.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (28, '3 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (28, '1.5 oz', 'Crème de Banana');
INSERT INTO IngredientOf VALUES (28, '1.5 oz', 'Pineapple juice');
INSERT INTO IngredientOf VALUES (29, '2 oz', 'Rum');
INSERT INTO IngredientOf VALUES (29, '2 oz', 'Passoa');
INSERT INTO IngredientOf VALUES (29, '6 oz', 'Sprite');
INSERT INTO IngredientOf VALUES (30, '.25 cup', 'Rum');
INSERT INTO IngredientOf VALUES (30, '.5 cup', 'Fresca');
INSERT INTO IngredientOf VALUES (31, '1 oz', 'Peach schnapps');
INSERT INTO IngredientOf VALUES (31, '1 oz', 'Rum');
INSERT INTO IngredientOf VALUES (31, '1 oz', 'Gin');
INSERT INTO IngredientOf VALUES (31, '.5 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (31, '1 oz', 'Triple sec');
INSERT INTO IngredientOf VALUES (32, '4 oz', 'Rum');
INSERT INTO IngredientOf VALUES (32, '4 oz', 'Tonic water');
INSERT INTO IngredientOf VALUES (32, '.5 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Grape juice');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Blue curacao');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Sour mix');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (33, '.5 oz', 'Grapefruit jucie');
INSERT INTO IngredientOf VALUES (34, '2 oz', 'Southern Comfort');
INSERT INTO IngredientOf VALUES (34, '1 oz', 'Pepperment schnapps');
INSERT INTO IngredientOf VALUES (34, '8 oz', 'Fruit punch');
INSERT INTO IngredientOf VALUES (34, '1 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (35, '1 oz', 'Baileys');
INSERT INTO IngredientOf VALUES (35, '1 oz', 'Kahlua');
INSERT INTO IngredientOf VALUES (35, '1 oz', 'Hazelnut schnapps');
INSERT INTO IngredientOf VALUES (35, '1 oz', 'Amaretto');
INSERT INTO IngredientOf VALUES (35, '1 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (36, '2 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (36, '12 oz', 'Beer');
INSERT INTO IngredientOf VALUES (36, '.5 oz', 'Tabasco');
INSERT INTO IngredientOf VALUES (36, '.25 oz', 'Celery salt');
INSERT INTO IngredientOf VALUES (37, '2 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (37, '5 oz', 'V8 juice');
INSERT INTO IngredientOf VALUES (37, '.25 oz', 'Worcestershire');
INSERT INTO IngredientOf VALUES (37, '.25 oz', 'Pepper sauce');
INSERT INTO IngredientOf VALUES (37, '.25 oz', 'Olive juice');
INSERT INTO IngredientOf VALUES (38, '1.5 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (38, '1.5 oz', 'Gin');
INSERT INTO IngredientOf VALUES (38, '1.5 oz', 'Peach schnapps');
INSERT INTO IngredientOf VALUES (38, '1.5 oz', 'Cinnamon schnapps');
INSERT INTO IngredientOf VALUES (38, '1.5 oz', 'Rum');
INSERT INTO IngredientOf VALUES (39, '1 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (39, '1 oz', 'Mango jucie');
INSERT INTO IngredientOf VALUES (39, '2 oz', 'Fresca');
INSERT INTO IngredientOf VALUES (40, '3 oz ', 'Vodka');
INSERT INTO IngredientOf VALUES (40, '1.5 oz ', 'Lime juice');
INSERT INTO IngredientOf VALUES (40, '6 oz ', 'Coca-cola ');
INSERT INTO IngredientOf VALUES (41, '1.5 oz', 'Galliano');
INSERT INTO IngredientOf VALUES (41, '1.5 oz', 'Crème de Menthe');
INSERT INTO IngredientOf VALUES (41, '1.5 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (41, '4 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (42, '1.5 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (42, '.5 oz', 'Blue Curacao');
INSERT INTO IngredientOf VALUES (42, '.25 oz', 'Grenadine');
INSERT INTO IngredientOf VALUES (42, '3.5 oz', 'Milk');
INSERT INTO IngredientOf VALUES (43, '4 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (43, '2 oz', 'Blue Curacao');
INSERT INTO IngredientOf VALUES (43, '1 oz', 'Amaretto');
INSERT INTO IngredientOf VALUES (43, '1', 'Egg white');
INSERT INTO IngredientOf VALUES (44, '2 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (44, '2 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (44, '2 oz', 'Tabasco');
INSERT INTO IngredientOf VALUES (45, '1.5 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (45, '1 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (45, '.5 oz', 'Pineapple juice');
INSERT INTO IngredientOf VALUES (45, '.25 oz', 'Lemon-lime soda');
INSERT INTO IngredientOf VALUES (46, '.5 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (46, '.5 oz', 'Triple sec');
INSERT INTO IngredientOf VALUES (46, '.5 oz', 'Crème de Banana');
INSERT INTO IngredientOf VALUES (46, '.5 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (46, '.5 oz', 'Sour mix');
INSERT INTO IngredientOf VALUES (47, '.5 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (47, '.5 oz', '151 proof rum');
INSERT INTO IngredientOf VALUES (47, '.5 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (48, '2 oz', 'Gin');
INSERT INTO IngredientOf VALUES (48, '2 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (48, '2 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (49, '2 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (49, '1 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (49, '.25 oz', 'Honey');
INSERT INTO IngredientOf VALUES (49, '.5 oz', 'Angostura bitters');
INSERT INTO IngredientOf VALUES (50, '.6 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (50, '.3 oz', 'Strawberry schnapps');
INSERT INTO IngredientOf VALUES (50, '1.5 oz', 'Milk');
INSERT INTO IngredientOf VALUES (50, '.5 oz', 'Grenadine');
INSERT INTO IngredientOf VALUES (51, '2 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (51, '2 oz', '7-Up');
INSERT INTO IngredientOf VALUES (52, '.75 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (52, '.5 oz', 'Sour apple pucker');
INSERT INTO IngredientOf VALUES (52, '.25 oz', 'Lime juice');
INSERT INTO IngredientOf VALUES (53, '.75 oz', 'Tequila');
INSERT INTO IngredientOf VALUES (53, '.75 oz', 'Kahlua');
INSERT INTO IngredientOf VALUES (53, '4 oz', 'Cream');
INSERT INTO IngredientOf VALUES (54, '2 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (54, '2 oz', 'Parfait dAmour');
INSERT INTO IngredientOf VALUES (54, '4 oz', 'Ginger ale');
INSERT INTO IngredientOf VALUES (55, '2 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (55, '10 oz', 'Mt. Dew');
INSERT INTO IngredientOf VALUES (56, '.5 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (56, '2 oz', 'Orange juice');
INSERT INTO IngredientOf VALUES (56, '1 oz', 'Rum');
INSERT INTO IngredientOf VALUES (56, '1 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (57, '2 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (57, '3 oz', 'Sour mix');
INSERT INTO IngredientOf VALUES (57, '3 oz', 'Ginger ale');
INSERT INTO IngredientOf VALUES (58, '1.5 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (58, '5 oz', 'Sour mix');
INSERT INTO IngredientOf VALUES (58, '.5 oz', 'Cherry juice');
INSERT INTO IngredientOf VALUES (58, '.25 oz', 'Bitters');
INSERT INTO IngredientOf VALUES (59, '3 oz', 'Vodka');
INSERT INTO IngredientOf VALUES (59, '3 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (59, '3 oz', 'Baileys');
INSERT INTO IngredientOf VALUES (59, '6 oz', 'Coffee');
INSERT INTO IngredientOf VALUES (59, '1 oz', 'Brown sugar');
INSERT INTO IngredientOf VALUES (60, '1.5 oz', 'Whiskey');
INSERT INTO IngredientOf VALUES (60, '1.5 oz', 'Grenadine');
INSERT INTO IngredientOf VALUES (60, '1.5 oz', '7-up');

INSERT INTO Users VALUES ('123', '123');
INSERT INTO Users VALUES ('Alyssa', 'Gonnella');
INSERT INTO Users VALUES ('Test1', 'Test1');
INSERT INTO Users VALUES ('Username', 'Password');
INSERT INTO Users VALUES ('Ashley', 'AG1234');
INSERT INTO Users VALUES ('David', '123ABC');
INSERT INTO Users VALUES ('Sarah', '23password');
INSERT INTO Users VALUES ('Aladdin', '1271222019');
INSERT INTO Users VALUES ('Kat', 'kat234');
INSERT INTO Users VALUES ('Seminole', 'FSU2019'); 

INSERT INTO Party VALUES (2000, '2019-12-05', 'FSU HCB', 'End of Semester Party'); 
INSERT INTO Party VALUES (2010, '2020-04-29', '516 W Jefferson St', 'Birthday Party');
INSERT INTO Party VALUES (2020, '2019-12-31', 'The Beach', 'New Years Eve');
INSERT INTO Party VALUES (2030, '2021-02-15', 'The Edison', 'New People Mixer');
INSERT INTO Party VALUES (2040, '2040-01-01', 'FSU LOVE', 'Just because');
INSERT INTO Party VALUES (2050, '2020-10-31', 'Five Guys', 'Lunch date');
INSERT INTO Party VALUES (2060, '2019-12-12', 'Madison Social', 'Sunday Brunch');
INSERT INTO Party VALUES (2070, '2020-03-12', 'FSU Civic Center', 'Engagement party');
INSERT INTO Party VALUES (2080, '2021-08-20', 'Proof Brewing', '21st birthday!');
INSERT INTO Party VALUES (2090, '2097-04-29', 'The Moon', '100th birthday!');

INSERT INTO Attending VALUES ('123', 2000);
INSERT INTO Attending VALUES ('Alyssa', 2000);
INSERT INTO Attending VALUES ('Kat', 2000);
INSERT INTO Attending VALUES ('Alyssa', 2010);
INSERT INTO Attending VALUES ('Test1', 2010);
INSERT INTO Attending VALUES ('Ashley', 2010);
INSERT INTO Attending VALUES ('Username', 2010);
INSERT INTO Attending VALUES ('David', 2010);
INSERT INTO Attending VALUES ('Aladdin', 2020);
INSERT INTO Attending VALUES ('Kat', 2020);
INSERT INTO Attending VALUES ('Seminole', 2020);
INSERT INTO Attending VALUES ('123', 2030);
INSERT INTO Attending VALUES ('Alyssa', 2030);
INSERT INTO Attending VALUES ('Test1', 2030);
INSERT INTO Attending VALUES ('Username', 2030);
INSERT INTO Attending VALUES ('Ashley', 2030);
INSERT INTO Attending VALUES ('David', 2030);
INSERT INTO Attending VALUES ('Alyssa', 2040);
INSERT INTO Attending VALUES ('David', 2040);
INSERT INTO Attending VALUES ('Seminole', 2040);
INSERT INTO Attending VALUES ('Sarah', 2050);
INSERT INTO Attending VALUES ('Aladdin', 2050);
INSERT INTO Attending VALUES ('Kat', 2060);
INSERT INTO Attending VALUES ('Sarah', 2060);
INSERT INTO Attending VALUES ('Test1', 2060);
INSERT INTO Attending VALUES ('123', 2060);
INSERT INTO Attending VALUES ('Username', 2070);
INSERT INTO Attending VALUES ('Test1', 2070);
INSERT INTO Attending VALUES ('David', 2070);
INSERT INTO Attending VALUES ('Seminole', 2080);
INSERT INTO Attending VALUES ('Sarah', 2080);
INSERT INTO Attending VALUES ('Kat', 2090);
INSERT INTO Attending VALUES ('123', 2090);
INSERT INTO Attending VALUES ('Aladdin', 2090);

INSERT INTO LikedBy VALUES ('123', 12);
INSERT INTO LikedBy VALUES ('123', 15);
INSERT INTO LikedBy VALUES ('123', 37);
INSERT INTO LikedBy VALUES ('123', 45);
INSERT INTO LikedBy VALUES ('123', 22);
INSERT INTO LikedBy VALUES ('123', 16);
INSERT INTO LikedBy VALUES ('Alyssa', 23);
INSERT INTO LikedBy VALUES ('Alyssa', 54);
INSERT INTO LikedBy VALUES ('Alyssa', 28);
INSERT INTO LikedBy VALUES ('Alyssa', 12);
INSERT INTO LikedBy VALUES ('Alyssa', 35);
INSERT INTO LikedBy VALUES ('Test1', 1);
INSERT INTO LikedBy VALUES ('Test1', 18);
INSERT INTO LikedBy VALUES ('Test1', 36);
INSERT INTO LikedBy VALUES ('Test1', 60);
INSERT INTO LikedBy VALUES ('Test1', 57);
INSERT INTO LikedBy VALUES ('Username', 12);
INSERT INTO LikedBy VALUES ('Username', 15);
INSERT INTO LikedBy VALUES ('Username', 28);
INSERT INTO LikedBy VALUES ('Username', 11);
INSERT INTO LikedBy VALUES ('Username', 1);
INSERT INTO LikedBy VALUES ('Ashley', 25);
INSERT INTO LikedBy VALUES ('Ashley', 4);
INSERT INTO LikedBy VALUES ('Ashley', 10);
INSERT INTO LikedBy VALUES ('Ashley', 24);
INSERT INTO LikedBy VALUES ('Ashley', 22);
INSERT INTO LikedBy VALUES ('David', 30);
INSERT INTO LikedBy VALUES ('David', 5);
INSERT INTO LikedBy VALUES ('David', 48);
INSERT INTO LikedBy VALUES ('David', 28);
INSERT INTO LikedBy VALUES ('David', 53);
INSERT INTO LikedBy VALUES ('Sarah', 42);
INSERT INTO LikedBy VALUES ('Sarha', 35);
INSERT INTO LikedBy VALUES ('Sarha', 57);
INSERT INTO LikedBy VALUES ('Sarha', 3);
INSERT INTO LikedBy VALUES ('Sarha', 43);
INSERT INTO LikedBy VALUES ('Aladdin', 53);
INSERT INTO LikedBy VALUES ('Aladdin', 34);
INSERT INTO LikedBy VALUES ('Aladdin', 43);
INSERT INTO LikedBy VALUES ('Aladdin', 11);
INSERT INTO LikedBy VALUES ('Aladdin', 23);
INSERT INTO LikedBy VALUES ('Kat', 28);
INSERT INTO LikedBy VALUES ('Kat', 24);
INSERT INTO LikedBy VALUES ('Kat', 27);
INSERT INTO LikedBy VALUES ('Kat', 57);
INSERT INTO LikedBy VALUES ('Kat', 5);
INSERT INTO LikedBy VALUES ('Seminole', 6);
INSERT INTO LikedBy VALUES ('Seminole', 17);
INSERT INTO LikedBy VALUES ('Seminole', 30);
INSERT INTO LikedBy VALUES ('Seminole', 11);
INSERT INTO LikedBy VALUES ('Seminole', 48);




















