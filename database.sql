PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE quotes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  quote TEXT NOT NULL,
  author TEXT NOT NULL,
  html_quote TEXT NOT NULL,
  lang TEXT NOT NULL DEFAULT 'en',
  url TEXT NOT NULL
);
INSERT INTO quotes VALUES(1,'He who violates another''s honor loses his own.','Publilius Syrus','<blockquote>&ldquo;He who violates another''s honor loses his own.&rdquo; &mdash; <footer>Publilius Syrus</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(2,'Most people fail in life because they major in minor things.','Tony Robbins','\u003Cblockquote\u003E&ldquo;Most people fail in life because they major in minor things.&rdquo; &mdash; \u003Cfooter\u003ETony Robbins\u003C/footer\u003E\u003C/blockquote\u003E','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(3,'Nothing is really work unless you would rather be doing something else. ','James Matthew Barrie','<blockquote>&ldquo;Nothing is really work unless you would rather be doing something else. &rdquo; &mdash; <footer>James Matthew Barrie</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(4,'Difficult roads often lead to beautiful destinations.','Unknown','<blockquote>&ldquo;Difficult roads often lead to beautiful destinations.&rdquo; &mdash; <footer>Unknown</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(5,'Good entrepreneurs don''t fail because they stay at it.','Naval Ravikant','<blockquote>&ldquo;Good entrepreneurs don''t fail because they stay at it.&rdquo; &mdash; <footer>Naval Ravikant</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(6,'The future doesn''t belong to the faint-hearted; it belongs to the brave.','Ronald Reagan','<blockquote>&ldquo;The future doesn''t belong to the faint-hearted; it belongs to the brave.&rdquo; &mdash; <footer>Ronald Reagan</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(7,'You purchase pain with all that joy can give and die of nothing but a rage to live.','Alexander Pope','<blockquote>&ldquo;You purchase pain with all that joy can give and die of nothing but a rage to live.&rdquo; &mdash; <footer>Alexander Pope</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(8,'It takes a minute to have a crush on someone, an hour to like someone, and a day to love someone... but it takes a lifetime to forget someone.','Kahlil Gibran','<blockquote>&ldquo;It takes a minute to have a crush on someone, an hour to like someone, and a day to love someone... but it takes a lifetime to forget someone.&rdquo; &mdash; <footer>Kahlil Gibran</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(9,'Thinking is difficult, that''s why most people judge.','Carl Jung','<blockquote>&ldquo;Thinking is difficult, that''s why most people judge.&rdquo; &mdash; <footer>Carl Jung</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(10,'Setting goals is the first step in turning the invisible into the visible.','Tony Robbins','<blockquote>&ldquo;Setting goals is the first step in turning the invisible into the visible.&rdquo; &mdash; <footer>Tony Robbins</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(11,'All that we see or seem is but a dream within a dream.','Edgar Allan Poe','<blockquote>&ldquo;All that we see or seem is but a dream within a dream.&rdquo; &mdash; <footer>Edgar Allan Poe</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(12,'Every night before going to sleep, we must ask ourselves: what weakness did I overcome today? What virtue did I acquire?','Seneca','<blockquote>&ldquo;Every night before going to sleep, we must ask ourselves: what weakness did I overcome today? What virtue did I acquire?&rdquo; &mdash; <footer>Seneca</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(13,'Opportunity is missed by most people because it is dressed in overalls and looks like work.','Thomas Edison','<blockquote>&ldquo;Opportunity is missed by most people because it is dressed in overalls and looks like work.&rdquo; &mdash; <footer>Thomas Edison</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(14,'Catch, then, O catch the transient hour; Improve each moment as it flies! ','St. Jerome','<blockquote>&ldquo;Catch, then, O catch the transient hour; Improve each moment as it flies! &rdquo; &mdash; <footer>St. Jerome</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(23,'A mountain never yields to the wind no matter how strong it is.','Zen Proverb','<blockquote>&ldquo;A mountain never yields to the wind no matter how strong it is.&rdquo; &mdash; <footer>Zen Proverb</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(24,'Living a life that has a greater purpose and living up to it is the ultimate degree that we should strive for.','Gurbaksh Chahal','<blockquote>&ldquo;Living a life that has a greater purpose and living up to it is the ultimate degree that we should strive for.&rdquo; &mdash; <footer>Gurbaksh Chahal</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(25,'The mirror is a worthless invention. The only way to truly see yourself is in the reflection of someone elses. eyes.','Voltaire','<blockquote>&ldquo;The mirror is a worthless invention. The only way to truly see yourself is in the reflection of someone elses. eyes.&rdquo; &mdash; <footer>Voltaire</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(26,'Simplicity is a difficult thing to achieve.  ','Charlie Chaplin','<blockquote>&ldquo;Simplicity is a difficult thing to achieve.  &rdquo; &mdash; <footer>Charlie Chaplin</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(27,'Anger, ego, jealousy are the biggest diseases,Keep yourself aloof from these three diseases.','Sathya Sai Baba','<blockquote>&ldquo;Anger, ego, jealousy are the biggest diseases,Keep yourself aloof from these three diseases.&rdquo; &mdash; <footer>Sathya Sai Baba</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(28,'The deeper the truth in a creative work, the longer it will live.  ','Charlie Chaplin','<blockquote>&ldquo;The deeper the truth in a creative work, the longer it will live.  &rdquo; &mdash; <footer>Charlie Chaplin</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(29,'Spend eighty percent of your time focusing on the opportunities of tomorrow rather than the problems of yesterday.','Brian Tracy','<blockquote>&ldquo;Spend eighty percent of your time focusing on the opportunities of tomorrow rather than the problems of yesterday.&rdquo; &mdash; <footer>Brian Tracy</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(30,'Follow your heart, listen to your inner voice, stop caring about what others think.','Roy T. Bennett','<blockquote>&ldquo;Follow your heart, listen to your inner voice, stop caring about what others think.&rdquo; &mdash; <footer>Roy T. Bennett</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(31,'Nothing is more creative...nor destructive...than a brilliant mind with a purpose.','Dan Brown','<blockquote>&ldquo;Nothing is more creative...nor destructive...than a brilliant mind with a purpose.&rdquo; &mdash; <footer>Dan Brown</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(32,'There are no contests in the Art of Peace. A true warrior is invincible because he or she contests with nothing.','Morihei Ueshiba','<blockquote>&ldquo;There are no contests in the Art of Peace. A true warrior is invincible because he or she contests with nothing.&rdquo; &mdash; <footer>Morihei Ueshiba</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(33,'When one does not have what one wants, one must want what one has.','Sigmund Freud','<blockquote>&ldquo;When one does not have what one wants, one must want what one has.&rdquo; &mdash; <footer>Sigmund Freud</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(34,'All life is a manifestation of the spirit, the manifestation of love.','Morihei Ueshiba','<blockquote>&ldquo;All life is a manifestation of the spirit, the manifestation of love.&rdquo; &mdash; <footer>Morihei Ueshiba</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(35,'Amateurs sit and wait for inspiration, the rest of us just get up and got to work.','Stephen King','<blockquote>&ldquo;Amateurs sit and wait for inspiration, the rest of us just get up and got to work.&rdquo; &mdash; <footer>Stephen King</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(36,'You find peace not by rearranging the circumstances of your life, but by realizing who you are at the deepest level.','Eckhart Tolle','<blockquote>&ldquo;You find peace not by rearranging the circumstances of your life, but by realizing who you are at the deepest level.&rdquo; &mdash; <footer>Eckhart Tolle</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(37,'Never argue with stupid people, they will drag you down to their level and then beat you with experience.','Mark Twain','<blockquote>&ldquo;Never argue with stupid people, they will drag you down to their level and then beat you with experience.&rdquo; &mdash; <footer>Mark Twain</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(38,'Real loss is only possible when you love something more than you love yourself.','Robin Williams','<blockquote>&ldquo;Real loss is only possible when you love something more than you love yourself.&rdquo; &mdash; <footer>Robin Williams</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(39,'In all chaos there is a cosmos, in all disorder a secret order.','Carl Jung','<blockquote>&ldquo;In all chaos there is a cosmos, in all disorder a secret order.&rdquo; &mdash; <footer>Carl Jung</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(40,'The goal is not to be perfect by the end, the goal is to be better today.','Simon Sinek','<blockquote>&ldquo;The goal is not to be perfect by the end, the goal is to be better today.&rdquo; &mdash; <footer>Simon Sinek</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(41,'People do not decide their futures, they decide their habits and their habits decide their futures.','Gary Keller','<blockquote>&ldquo;People do not decide their futures, they decide their habits and their habits decide their futures.&rdquo; &mdash; <footer>Gary Keller</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(42,'Life can only be understood backwards; but it must be lived forwards.','Soren Kierkegaard','<blockquote>&ldquo;Life can only be understood backwards; but it must be lived forwards.&rdquo; &mdash; <footer>Soren Kierkegaard</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(43,'Human happiness and moral duty are inseparably connected. ','George Washington','<blockquote>&ldquo;Human happiness and moral duty are inseparably connected. &rdquo; &mdash; <footer>George Washington</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(44,'Your goals are the road maps that guide you and show you what is possible for your life.','Les Brown','<blockquote>&ldquo;Your goals are the road maps that guide you and show you what is possible for your life.&rdquo; &mdash; <footer>Les Brown</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(45,'Anyone who dreams of an uncommon life eventually discovers there is no choice but to seek an uncommon approach to living it.','Gary Keller','<blockquote>&ldquo;Anyone who dreams of an uncommon life eventually discovers there is no choice but to seek an uncommon approach to living it.&rdquo; &mdash; <footer>Gary Keller</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(46,'If you''ve made a mistake, it''s better just to laugh at it.','Zen Proverb','<blockquote>&ldquo;If you''ve made a mistake, it''s better just to laugh at it.&rdquo; &mdash; <footer>Zen Proverb</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(47,'Beware of false knowledge, it is more dangerous than ignorance.','George Bernard Shaw','<blockquote>&ldquo;Beware of false knowledge, it is more dangerous than ignorance.&rdquo; &mdash; <footer>George Bernard Shaw</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(48,'Every day do something that will inch you closer to a better tomorrow.','Unknown','<blockquote>&ldquo;Every day do something that will inch you closer to a better tomorrow.&rdquo; &mdash; <footer>Unknown</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(49,'Life and death are of supreme importance. Time swiftly passes by and opportunity is lost.','Dogen','<blockquote>&ldquo;Life and death are of supreme importance. Time swiftly passes by and opportunity is lost.&rdquo; &mdash; <footer>Dogen</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(50,'I was wise enough to never grow up while fooling most people into believing I had. ','Margaret Mead','<blockquote>&ldquo;I was wise enough to never grow up while fooling most people into believing I had. &rdquo; &mdash; <footer>Margaret Mead</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(51,'All leaders are readers.','Jim Rohn','<blockquote>&ldquo;All leaders are readers.&rdquo; &mdash; <footer>Jim Rohn</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(52,'Among the things you can give and still keep are your word, a smile, and a grateful heart.','Zig Ziglar','<blockquote>&ldquo;Among the things you can give and still keep are your word, a smile, and a grateful heart.&rdquo; &mdash; <footer>Zig Ziglar</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(53,'All power is from within and therefore under our control.','Robert Collier','<blockquote>&ldquo;All power is from within and therefore under our control.&rdquo; &mdash; <footer>Robert Collier</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(54,'Don''t let your learning lead to knowledge. Let your learning lead to action.','Jim Rohn','<blockquote>&ldquo;Don''t let your learning lead to knowledge. Let your learning lead to action.&rdquo; &mdash; <footer>Jim Rohn</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(55,'Your past does not equal your future.','Tony Robbins','<blockquote>&ldquo;Your past does not equal your future.&rdquo; &mdash; <footer>Tony Robbins</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(56,'To find yourself, think for yourself.','Socrates','<blockquote>&ldquo;To find yourself, think for yourself.&rdquo; &mdash; <footer>Socrates</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(57,'Money is only a tool. It will take you wherever you wish, but it will not replace you as the driver.','Ayn Rand','<blockquote>&ldquo;Money is only a tool. It will take you wherever you wish, but it will not replace you as the driver.&rdquo; &mdash; <footer>Ayn Rand</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(58,'It is secondary whether we choose belief or defiance. What is precious is that we are always able to choose.','Ming-Dao Deng','<blockquote>&ldquo;It is secondary whether we choose belief or defiance. What is precious is that we are always able to choose.&rdquo; &mdash; <footer>Ming-Dao Deng</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(59,'Be happy in the moment, that''s enough. Each moment is all we need, not more.','Mother Teresa','<blockquote>&ldquo;Be happy in the moment, that''s enough. Each moment is all we need, not more.&rdquo; &mdash; <footer>Mother Teresa</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(60,'The secret of life isn''t what happens to you, but what you do with what happens to you.','Norman Vincent Peale','<blockquote>&ldquo;The secret of life isn''t what happens to you, but what you do with what happens to you.&rdquo; &mdash; <footer>Norman Vincent Peale</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(61,'Trust, like the soul, never returns once it is gone.','Publilius Syrus','<blockquote>&ldquo;Trust, like the soul, never returns once it is gone.&rdquo; &mdash; <footer>Publilius Syrus</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(62,'If you are not living each day with excitement, energy, and passion, then you are not living true to your life purpose.','Celestine Chua','<blockquote>&ldquo;If you are not living each day with excitement, energy, and passion, then you are not living true to your life purpose.&rdquo; &mdash; <footer>Celestine Chua</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(63,'You can have results or excuses, but not both.','Arnold Schwarzenegger','<blockquote>&ldquo;You can have results or excuses, but not both.&rdquo; &mdash; <footer>Arnold Schwarzenegger</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(64,'The whole problem with the world is the fools and fanatics are always so sure of themselves, and wiser people are full of doubts.','George Bernard Shaw','<blockquote>&ldquo;The whole problem with the world is the fools and fanatics are always so sure of themselves, and wiser people are full of doubts.&rdquo; &mdash; <footer>George Bernard Shaw</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(65,'Some people want it to happen, some wish it would happen, others make it happen.','Michael Jordan','<blockquote>&ldquo;Some people want it to happen, some wish it would happen, others make it happen.&rdquo; &mdash; <footer>Michael Jordan</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(66,'I am who I am today because of the choices I made yesterday.','Eleanor Roosevelt','<blockquote>&ldquo;I am who I am today because of the choices I made yesterday.&rdquo; &mdash; <footer>Eleanor Roosevelt</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(67,'The secret of success lies not in doing your own work, but in recognizing the right man to do it.','Andrew Carnegie','<blockquote>&ldquo;The secret of success lies not in doing your own work, but in recognizing the right man to do it.&rdquo; &mdash; <footer>Andrew Carnegie</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(68,'Start the day with love, spend the day with love, fill the day with love and end the day with love.','Sathya Sai Baba','<blockquote>&ldquo;Start the day with love, spend the day with love, fill the day with love and end the day with love.&rdquo; &mdash; <footer>Sathya Sai Baba</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(69,'Nothing important is learned; it is simply remembered.','Carlos Ruiz Zafon','<blockquote>&ldquo;Nothing important is learned; it is simply remembered.&rdquo; &mdash; <footer>Carlos Ruiz Zafon</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(70,'There are only encounters in history. There are no accidents.','Pablo Picasso','<blockquote>&ldquo;There are only encounters in history. There are no accidents.&rdquo; &mdash; <footer>Pablo Picasso</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(71,'Yesterday is history, tomorrow is a mystery, today is God''s gift, that''s why we call it the present.','Joan Rivers','<blockquote>&ldquo;Yesterday is history, tomorrow is a mystery, today is God''s gift, that''s why we call it the present.&rdquo; &mdash; <footer>Joan Rivers</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(72,'Through selfless service, you will always be fruitful and find the fulfillment of your desires.','Bhagavad Gita','<blockquote>&ldquo;Through selfless service, you will always be fruitful and find the fulfillment of your desires.&rdquo; &mdash; <footer>Bhagavad Gita</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(73,'Be content with what you have, rejoice in the way things are. When you realize there is nothing lacking, the whole world belongs to you.','Lao Tzu','<blockquote>&ldquo;Be content with what you have, rejoice in the way things are. When you realize there is nothing lacking, the whole world belongs to you.&rdquo; &mdash; <footer>Lao Tzu</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(74,'Make yourself so useful to other people, that they think you are irreplaceable.','Og Mandino','<blockquote>&ldquo;Make yourself so useful to other people, that they think you are irreplaceable.&rdquo; &mdash; <footer>Og Mandino</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(75,'People have the illusion that all over the world, all the time, all kinds of fantastic things are happening.','David Brinkley','<blockquote>&ldquo;People have the illusion that all over the world, all the time, all kinds of fantastic things are happening.&rdquo; &mdash; <footer>David Brinkley</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(76,'Imagination is everything. It is the preview of life''s coming attractions.','Albert Einstein','<blockquote>&ldquo;Imagination is everything. It is the preview of life''s coming attractions.&rdquo; &mdash; <footer>Albert Einstein</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(77,'There are as many opinions as there are experts.','Franklin D. Roosevelt','<blockquote>&ldquo;There are as many opinions as there are experts.&rdquo; &mdash; <footer>Franklin D. Roosevelt</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(78,'The most tragic thing in the world is a man of genius who is not a man of honor.','George Bernard Shaw','<blockquote>&ldquo;The most tragic thing in the world is a man of genius who is not a man of honor.&rdquo; &mdash; <footer>George Bernard Shaw</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(79,'Don''t just sit there. Do something. The answers will follow.','Mark Manson','<blockquote>&ldquo;Don''t just sit there. Do something. The answers will follow.&rdquo; &mdash; <footer>Mark Manson</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(80,'Make yourself so useful to other people, that they think you are irreplaceable.','Og Mandino','<blockquote>&ldquo;Make yourself so useful to other people, that they think you are irreplaceable.&rdquo; &mdash; <footer>Og Mandino</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(81,'Talk to someone about themselves and they''ll listen for hours.','Dale Carnegie','<blockquote>&ldquo;Talk to someone about themselves and they''ll listen for hours.&rdquo; &mdash; <footer>Dale Carnegie</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(82,'Integrity is the ability to stand by an idea.','Ayn Rand','<blockquote>&ldquo;Integrity is the ability to stand by an idea.&rdquo; &mdash; <footer>Ayn Rand</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(83,'To be of use to the world is the only way to be happy.','Hans Christian Andersen','<blockquote>&ldquo;To be of use to the world is the only way to be happy.&rdquo; &mdash; <footer>Hans Christian Andersen</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(84,'If there''s a definition of freedom, I think it''s this: living life on your terms.','Kamal Ravikant','<blockquote>&ldquo;If there''s a definition of freedom, I think it''s this: living life on your terms.&rdquo; &mdash; <footer>Kamal Ravikant</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(85,'Your purpose will be clear only when you listen to your heart.','Lolly Daskal','<blockquote>&ldquo;Your purpose will be clear only when you listen to your heart.&rdquo; &mdash; <footer>Lolly Daskal</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(86,'If anything is worth doing, do it with all your heart.','Buddha','<blockquote>&ldquo;If anything is worth doing, do it with all your heart.&rdquo; &mdash; <footer>Buddha</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(87,'Do not stop thinking of life as an adventure.','Eleanor Roosevelt','<blockquote>&ldquo;Do not stop thinking of life as an adventure.&rdquo; &mdash; <footer>Eleanor Roosevelt</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(88,'There are no second chances in life, except to feel remorse.','Carlos Ruiz Zafon','<blockquote>&ldquo;There are no second chances in life, except to feel remorse.&rdquo; &mdash; <footer>Carlos Ruiz Zafon</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(89,'Either get busy living or get busy dying.','Stephen King','<blockquote>&ldquo;Either get busy living or get busy dying.&rdquo; &mdash; <footer>Stephen King</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(90,'The consequences of today are determined by the actions of the past. To change your future, alter your decisions today.','Unknown','<blockquote>&ldquo;The consequences of today are determined by the actions of the past. To change your future, alter your decisions today.&rdquo; &mdash; <footer>Unknown</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(91,'You have to give up some of the old so that you can make room for the new.','Yanni','<blockquote>&ldquo;You have to give up some of the old so that you can make room for the new.&rdquo; &mdash; <footer>Yanni</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(92,'The biggest challenge after success is shutting up about it.','Criss Jami','<blockquote>&ldquo;The biggest challenge after success is shutting up about it.&rdquo; &mdash; <footer>Criss Jami</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(93,'Our joy does not have to be based on our circumstances.','Joyce Meyer','<blockquote>&ldquo;Our joy does not have to be based on our circumstances.&rdquo; &mdash; <footer>Joyce Meyer</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(94,'Nothing is more creative...nor destructive...than a brilliant mind with a purpose.','Dan Brown','<blockquote>&ldquo;Nothing is more creative...nor destructive...than a brilliant mind with a purpose.&rdquo; &mdash; <footer>Dan Brown</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(95,'The final mystery is oneself.','Oscar Wilde','<blockquote>&ldquo;The final mystery is oneself.&rdquo; &mdash; <footer>Oscar Wilde</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(96,'Progress lies not in enhancing what is, but in advancing toward what will be.','Kahlil Gibran','<blockquote>&ldquo;Progress lies not in enhancing what is, but in advancing toward what will be.&rdquo; &mdash; <footer>Kahlil Gibran</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(97,'When you say yes to change, you are choosing to navigate that path peacefully and happily and see where it takes you.','Sonia Ricotti','<blockquote>&ldquo;When you say yes to change, you are choosing to navigate that path peacefully and happily and see where it takes you.&rdquo; &mdash; <footer>Sonia Ricotti</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(98,'We must not cease from exploration. And the end of all our exploring will be to arrive where we began and to know the place for the first time.','T.S. Eliot','<blockquote>&ldquo;We must not cease from exploration. And the end of all our exploring will be to arrive where we began and to know the place for the first time.&rdquo; &mdash; <footer>T.S. Eliot</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(99,'If it entertains you now but will bore you someday, it''s a distraction. Keep looking.','Naval Ravikant','<blockquote>&ldquo;If it entertains you now but will bore you someday, it''s a distraction. Keep looking.&rdquo; &mdash; <footer>Naval Ravikant</footer></blockquote>','en','https://zenquotes.io/api/random');
INSERT INTO quotes VALUES(100,'Excuses are the lies you convince yourself are true to avoid proving you are worthy of the gift you were given.','Steve Harvey','<blockquote>&ldquo;Excuses are the lies you convince yourself are true to avoid proving you are worthy of the gift you were given.&rdquo; &mdash; <footer>Steve Harvey</footer></blockquote>','en','https://zenquotes.io/api/random');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('quotes',100);