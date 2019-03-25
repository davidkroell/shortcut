insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('evonoertzen0@go.com', 'Edie', 'Von Oertzen', 'wk0FFx',
        '2018-08-18 16:05:17', '2019-11-30 01:15:54', '2020-04-10 01:37:50');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('cstaintonskinn1@1688.com', 'Chan', 'Stainton - Skinn', 'i2IIZI',
        '2018-10-31 02:06:05', '2019-03-13 22:21:46', '2020-10-16 08:03:18');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('sbrilon2@adobe.com', 'Shanon', 'Brilon', 'JkpnNcPM',
        '2018-05-14 02:39:20', '2019-12-11 01:50:07', '2020-05-27 04:22:28');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('aabbets3@soundcloud.com', 'Alexa', 'Abbets', 'OWGVLUm',
        '2018-12-08 13:49:13', '2019-08-08 04:55:14', '2020-06-02 07:01:11');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('gtisun4@gnu.org', 'Georgina', 'Tisun', 'Bunnnv', '2018-03-20 00:31:53',
        '2019-08-11 04:48:05', '2020-04-27 18:28:09');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('bscoffham5@woothemes.com', 'Beauregard', 'Scoffham', 'FNEpOoZYZZ',
        '2018-05-05 22:32:57', '2019-02-06 18:25:33', '2020-05-31 08:27:01');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('bchevins6@buzzfeed.com', 'Bunnie', 'Chevins', 'aZqGIr5',
        '2018-07-25 05:25:52', '2019-06-02 03:00:09', '2020-07-28 09:05:22');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('jmcgaffey7@hp.com', 'Jasmina', 'McGaffey', 'wA07qhH1G3',
        '2018-08-21 18:35:41', '2019-06-22 05:00:11', '2020-03-19 12:22:59');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('cdartnall8@economist.com', 'Catharine', 'Dartnall', 'nzUINCBrrH5',
        '2018-02-07 19:50:07', '2019-11-29 07:59:08', '2020-06-09 12:18:44');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('kspringell9@ustream.tv', 'Kerrie', 'Springell', 'cZupr0MuklqF',
        '2018-02-02 11:25:14', '2019-07-07 10:25:16', '2020-06-30 06:23:21');
insert into Users (Email, Firstname, Lastname, PasswordHash, CreatedAt, UpdatedAt, LastLogin)
values ('hmersh41@dell.com', 'Hortense', 'Mersh', '$2y$12$tShEMkzDjNDMaquL40hTq.tAfhWEf84OypeotqvIn1vpGO9J.MmA.',
        '2018-05-30 08:51:24', '2019-09-28 11:54:41', '2020-01-26 18:07:17');

insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-19 04:58:12', '2019-06-30 04:46:55', '2020-12-31 14:46:08',
        'https://blinklist.com/tellus/semper/interdum.xml', 'JcVeHvj0', 301,
        1);
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-17 23:15:42', '2019-02-07 23:00:42', '2020-02-17 07:33:33',
        'https://unblog.fr/consequat/in/consequat/ut/nulla/sed/accumsan.jpg', 'du4pWpWM', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-05 10:01:08', '2019-11-04 07:56:22', '2020-05-01 07:33:32',
        'https://mashable.com/feugiat/et/eros/vestibulum/ac/est.xml', 'KenGwams6', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-07 09:06:51', '2019-06-15 14:32:11', '2020-03-02 06:48:55',
        'http://arstechnica.com/aliquam.html', 'r1W2McgLT7', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-07 13:56:12', '2019-06-17 22:06:08', '2020-10-22 16:21:33',
        'http://tuttocitta.it/viverra/pede/ac/diam.aspx', 'FmCJXSWYJ', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-25 02:13:56', '2019-06-15 17:53:26', '2020-08-06 02:02:57',
        'http://edublogs.org/neque.json', 'KI2B6Zkjlj1I', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-06 13:48:40', '2019-05-27 10:43:12', '2020-11-01 14:34:39',
        'https://tuttocitta.it/sociis.png', 'a86Jqh', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-13 11:05:11', '2019-08-28 18:11:47', '2020-05-10 15:16:24',
        'http://hugedomains.com/vivamus.json', 'VPD0Mgv', 301, 7);
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-23 03:33:33', '2019-03-05 01:49:13', '2020-05-06 10:10:01',
        'https://forbes.com/in.aspx', 'vUEGvl1eFYV', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-06 17:20:05', '2019-02-28 09:23:56', '2020-05-11 02:58:58',
        'http://netvibes.com/lacinia/eget/tincidunt/eget.xml', 'jc6Om6Nbt', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-27 18:48:18', '2019-07-30 20:45:40', '2020-12-19 02:10:25',
        'https://acquirethisname.com/in.jpg', 'nnPeUIwf5S', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-23 02:52:53', '2019-04-20 19:09:12', '2020-04-15 05:20:15',
        'http://last.fm/a/suscipit/nulla/elit/ac/nulla/sed.aspx', '8i25vp1bT', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-27 12:22:50', '2019-04-15 10:27:41', '2020-04-23 19:15:06',
        'https://hc360.com/volutpat/dui/maecenas/tristique/est/et.html', 'DUXJ1a', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-17 18:11:08', '2019-03-18 19:57:26', '2020-06-28 16:32:39',
        'http://soup.io/morbi.json', 'OGIRjz', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-06 04:54:12', '2019-09-13 01:00:47', '2020-01-20 09:24:05',
        'https://joomla.org/penatibus.json', '7V2FZI', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-06 16:49:21', '2019-08-24 00:30:24', '2020-07-16 18:19:10',
        'https://irs.gov/praesent.jpg', 'olxCjHtWr', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-30 20:04:46', '2019-02-07 20:35:12', '2020-02-11 14:49:41',
        'https://bbc.co.uk/felis/eu.jsp', '4Khy4BS1dy', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-17 11:34:41', '2019-06-10 02:51:30', '2020-05-05 22:32:16',
        'http://live.com/interdum/mauris/ullamcorper/purus.jpg', 'YrGoui', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-23 19:50:51', '2019-05-23 07:28:30', '2020-03-14 01:38:57',
        'https://berkeley.edu/nulla/ac/enim/in/tempor/turpis/nec.js', '9sbr503', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-19 16:32:45', '2019-05-19 13:20:23', '2020-07-21 07:12:12',
        'http://va.gov/sit/amet.jsp', 'oohai8DuGhg', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-08 09:31:41', '2019-09-09 22:45:07', '2020-08-16 15:15:40',
        'http://springer.com/ullamcorper/purus/sit/amet/nulla/quisque.png', 'pe0fpt', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-28 08:57:12', '2019-07-17 14:31:01', '2020-07-20 06:37:31',
        'https://multiply.com/pulvinar/lobortis.png', '2Ht92xHEFR', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-24 10:15:45', '2019-01-26 04:19:24', '2020-12-08 10:30:55',
        'http://unc.edu/augue/a/suscipit/nulla/elit.xml', 'Kdm47tjBeWeT', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-22 10:31:25', '2019-08-12 17:09:22', '2020-06-22 15:47:06',
        'https://hubpages.com/nunc/purus/phasellus/in/felis.js', 'MrbDQ1oxh5', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-05 15:07:19', '2019-04-28 13:25:23', '2020-11-21 13:56:35',
        'http://nba.com/morbi/a/ipsum/integer.jpg', 'BZeB9m', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-25 15:43:40', '2019-12-13 10:50:28', '2020-11-22 13:19:37',
        'http://arstechnica.com/proin/at/turpis/a/pede/posuere/nonummy.json', 'mmWeSE', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-21 06:22:52', '2019-06-17 21:45:39', '2020-01-10 16:12:38',
        'http://umn.edu/sed/sagittis/nam/congue/risus.aspx', '6fBS16Lj', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-02 11:31:31', '2019-08-24 22:44:30', '2020-05-08 16:11:19',
        'http://accuweather.com/praesent/blandit/nam/nulla.aspx', 'BwLlLjQEJ', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-12 19:28:03', '2019-02-23 10:15:50', '2020-01-04 03:50:16',
        'http://opensource.org/maecenas/pulvinar/lobortis/est.json', '6M1123X', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-17 23:50:56', '2019-07-02 13:50:40', '2020-01-07 01:39:53',
        'http://utexas.edu/eget/semper/rutrum.png', 'tWQC6fG51Az', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-21 19:00:02', '2019-01-05 00:17:21', '2020-03-02 11:22:55',
        'https://nps.gov/at/lorem/integer/tincidunt/ante/vel/ipsum.json', 'ApUvUv4Mnj', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-06 20:21:21', '2019-12-04 19:07:54', '2020-08-19 05:35:27',
        'http://ox.ac.uk/etiam/justo/etiam/pretium/iaculis.js', 'He5SqwD3NI9Y', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-07 02:15:29', '2019-03-21 16:35:28', '2020-04-18 11:55:04',
        'http://furl.net/eu/nibh.jsp', 'eMmbdKG', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-23 13:09:55', '2019-06-21 17:54:53', '2020-09-24 16:40:44',
        'https://digg.com/nisi/vulputate/nonummy/maecenas/tincidunt/lacus.png', 'OPBxVJLM', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-05 07:22:41', '2019-10-03 02:28:32', '2020-05-07 02:29:48',
        'http://washington.edu/nascetur/ridiculus.json', 'Pc1DdcRHVuw', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-24 14:20:02', '2019-09-19 00:47:58', '2020-10-17 01:21:36',
        'http://hc360.com/nibh.jpg', 'CTKm66t52ue', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-03 07:49:11', '2019-09-26 18:30:41', '2020-08-12 18:27:51',
        'http://tripod.com/nulla/facilisi.aspx', 'XygHpnlfC', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-04 13:59:30', '2019-11-25 01:43:39', '2020-07-19 23:40:24',
        'http://phoca.cz/id.json', 'KgZo7e', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-09 14:03:44', '2019-02-14 11:25:21', '2020-04-08 05:30:35',
        'https://businessweek.com/in/hac/habitasse/platea/dictumst/morbi.jpg', 'lMfMtgoK8R', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-08 02:40:02', '2019-08-05 17:27:46', '2020-06-02 15:13:27',
        'http://geocities.jp/in/sapien/iaculis/congue/vivamus/metus/arcu.xml', '2qk87Q4CA', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-14 17:23:46', '2019-02-04 03:26:45', '2020-05-29 02:08:47',
        'http://odnoklassniki.ru/enim/sit.json', 'x7BafO', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-29 18:50:49', '2019-09-03 22:05:28', '2020-11-02 10:15:55',
        'https://hubpages.com/dolor/quis/odio/consequat/varius/integer.png', 'Laj6fxATGK1', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-24 02:06:56', '2019-07-26 10:29:01', '2020-12-13 12:51:29',
        'http://gizmodo.com/ipsum/ac/tellus/semper/interdum/mauris.js', 'DO1Nn9KBoZDC', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-07 23:30:35', '2019-02-28 19:51:44', '2020-09-17 14:06:58',
        'https://opensource.org/enim/sit/amet/nunc/viverra/dapibus.html', 'yhbLCPpOQJ', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-29 15:46:59', '2019-04-28 04:46:01', '2020-08-08 05:28:16',
        'https://nhs.uk/in/lectus/pellentesque/at.jsp', 'kR4YSbBd', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-04 23:21:46', '2019-02-18 10:48:38', '2020-03-10 11:16:07',
        'https://redcross.org/nec/dui/luctus/rutrum.js', 'cH7rfuul1AI', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-11 06:26:24', '2019-01-07 17:01:21', '2020-03-07 19:33:45',
        'https://w3.org/nisi/eu/orci/mauris/lacinia/sapien.xml', 'ttCvXlph', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-23 00:42:26', '2019-08-17 06:51:16', '2020-03-24 10:38:16',
        'https://indiegogo.com/amet/consectetuer/adipiscing/elit/proin.xml', 'IoRuCf', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-14 11:55:12', '2019-11-18 14:10:16', '2020-03-08 22:43:45',
        'http://oracle.com/blandit.html', '5KRmAfugBG', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-16 16:30:53', '2019-06-20 11:41:16', '2020-08-24 15:32:12',
        'http://etsy.com/donec/odio/justo/sollicitudin/ut.json', 'BCoZ5UCEZK', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-12 07:50:56', '2019-09-21 15:47:52', '2020-05-14 10:47:27',
        'https://dagondesign.com/vivamus/vestibulum/sagittis/sapien.json', 'gWYrVfvv8xT', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-09 17:17:43', '2019-11-14 23:45:17', '2020-05-25 16:58:33',
        'https://answers.com/sodales/sed/tincidunt/eu/felis.html', 'ms7mSwBy5e', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-29 05:23:12', '2019-07-02 13:29:23', '2020-01-14 20:37:22',
        'https://dropbox.com/magna/at/nunc.jpg', 'psaPtsCyhy88', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-02 11:22:51', '2019-01-24 23:34:05', '2020-06-20 18:13:52',
        'http://vimeo.com/nulla/ultrices/aliquet/maecenas/leo/odio.xml', 'f9G8HJx', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-08 19:38:57', '2019-04-14 20:45:17', '2020-11-20 15:24:43',
        'https://icq.com/amet/consectetuer/adipiscing/elit/proin/interdum/mauris.json', 'uCuPxTsJcrsM', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-28 04:33:37', '2019-07-21 14:39:32', '2020-10-07 07:51:02',
        'https://bluehost.com/convallis/morbi.png', 's0rCnr0vx8Bk', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-17 18:46:42', '2019-11-25 22:03:09', '2020-08-25 06:01:04',
        'http://ihg.com/lorem/integer/tincidunt/ante/vel/ipsum/praesent.html', 'WwwZmWavE', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-05 19:29:01', '2019-11-05 10:46:36', '2020-01-22 13:39:03',
        'http://photobucket.com/convallis/nulla/neque/libero/convallis/eget/eleifend.html', 'Q1mxLRCNmw', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-14 06:24:59', '2019-08-26 17:14:12', '2020-04-13 15:35:47',
        'http://nyu.edu/sapien/iaculis/congue/vivamus/metus.aspx', 'xHrPuCDjVgF', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-21 00:41:05', '2019-10-19 03:44:57', '2020-03-27 16:53:38',
        'http://twitter.com/sapien.js', 'dDiSXUa4S', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-06 10:28:25', '2019-08-15 12:07:49', '2020-12-25 18:04:30',
        'http://howstuffworks.com/eleifend.json', 'v46wrdD', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-02 08:55:52', '2019-02-25 09:19:49', '2020-07-10 17:43:57',
        'http://comcast.net/mi/integer/ac.json', 'iUEubl', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-07 07:44:59', '2019-02-21 02:28:08', '2020-08-23 18:16:29',
        'https://aol.com/varius/integer.xml', '2nMG2xQ4lv48', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-23 15:58:06', '2019-06-03 18:21:00', '2020-06-17 19:14:03',
        'https://constantcontact.com/at/turpis/a/pede/posuere/nonummy.png', 'no9ssJqetf', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-07 12:15:05', '2019-11-20 20:48:50', '2020-12-24 06:54:44',
        'https://guardian.co.uk/a/nibh/in/quis/justo/maecenas.html', 'C36mwWX', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-07 04:48:31', '2019-09-26 20:47:32', '2020-08-22 00:41:11',
        'https://pinterest.com/sagittis/sapien.js', 'bCBEKuRs', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-16 07:57:09', '2019-08-11 00:12:39', '2020-07-08 21:32:34',
        'https://nifty.com/eros/vestibulum/ac/est/lacinia/nisi/venenatis.xml', 'buDWRM', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-08 02:55:09', '2019-04-29 12:59:19', '2020-08-20 12:09:16',
        'https://salon.com/curae/donec/pharetra/magna/vestibulum/aliquet/ultrices.json', 'JPlIcMe1hc9', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-26 03:44:54', '2019-01-17 09:44:29', '2020-05-16 14:49:49',
        'https://1und1.de/tincidunt/ante/vel.js', 'cRYG43Qx', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-18 20:33:15', '2019-09-05 01:23:25', '2020-06-01 12:37:55',
        'https://ucsd.edu/metus/vitae/ipsum/aliquam/non/mauris.xml', 'KazmdHen', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-21 23:22:50', '2019-01-18 22:23:19', '2020-01-12 06:06:45',
        'https://nhs.uk/nonummy.html', 'UJ5K4V63x', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-14 11:43:13', '2019-02-15 07:11:43', '2020-10-02 07:13:53',
        'http://dion.ne.jp/eros/elementum/pellentesque.jsp', '1EeeiJw8iih', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-23 19:27:04', '2019-10-30 04:53:20', '2020-02-15 09:43:12',
        'http://dyndns.org/arcu/adipiscing/molestie/hendrerit/at.aspx', 'WTnXVo8U', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-28 00:38:40', '2019-07-03 21:02:14', '2020-09-22 07:00:56',
        'http://ocn.ne.jp/elit/sodales/scelerisque/mauris/sit/amet.js', 'nhuSXiY7', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-22 04:27:23', '2019-06-13 01:54:01', '2020-11-03 01:59:25',
        'https://fastcompany.com/proin/at/turpis/a.js', '1c132Y', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-03 10:58:38', '2019-11-11 18:58:29', '2020-01-21 07:02:04',
        'http://disqus.com/vitae/quam/suspendisse/potenti/nullam/porttitor.jsp', 'HoeAlDV', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-02 07:41:19', '2019-01-22 02:18:50', '2020-11-17 17:03:37',
        'https://gizmodo.com/primis/in/faucibus/orci/luctus/et.html', 'DdSeEbFVBStL', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-13 22:09:39', '2019-02-28 20:55:44', '2020-09-06 16:45:51',
        'http://canalblog.com/at/lorem/integer/tincidunt/ante.aspx', '9Wu05rcE1e', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-30 21:54:54', '2019-02-05 21:58:26', '2020-04-27 08:52:56',
        'http://narod.ru/quis/orci/nullam.js', 'WsxjnMfqNt98', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-11 17:03:04', '2019-01-28 00:48:53', '2020-04-29 03:04:51',
        'https://tinypic.com/nec/condimentum/neque/sapien/placerat/ante/nulla.xml', '3GNNa0rYF0j', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-21 20:35:02', '2019-10-21 22:49:49', '2020-05-03 09:05:28',
        'http://reddit.com/tristique.jpg', 'zxqKHXMS', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-21 07:34:24', '2019-03-09 21:07:11', '2020-01-23 01:16:53',
        'https://stanford.edu/curae/nulla/dapibus/dolor/vel/est.jsp', '1iDDjvzp5lbv', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-06 03:26:51', '2019-08-13 03:11:28', '2020-09-25 03:08:21',
        'https://meetup.com/sit/amet.jpg', 'ATAzegxJ4r', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-07 19:58:05', '2019-05-26 18:49:12', '2020-01-12 15:57:37',
        'http://ca.gov/vestibulum/ante/ipsum.jsp', 'vHkJV2', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-12 18:09:35', '2019-07-29 07:47:05', '2020-06-27 09:25:17',
        'https://nytimes.com/nibh/ligula/nec/sem/duis/aliquam/convallis.aspx', 'O0wbwa7', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-09 12:33:31', '2019-01-25 12:07:43', '2020-02-13 13:46:56',
        'https://sohu.com/id/lobortis/convallis/tortor/risus.jpg', 'gI4NmrMaG4X', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-20 07:01:53', '2019-01-15 14:11:35', '2020-05-15 01:23:37',
        'https://foxnews.com/parturient/montes/nascetur/ridiculus/mus/etiam/vel.jsp', 't857qrlRPT', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-17 10:12:56', '2019-12-22 11:39:29', '2020-01-11 07:24:20',
        'https://techcrunch.com/amet/consectetuer.html', 'rtHsgHE', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-10 00:09:36', '2019-05-07 06:53:08', '2020-02-22 07:25:05',
        'https://dedecms.com/ante/vel/ipsum/praesent.json', '0tJMVR', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-15 12:44:30', '2019-11-04 12:17:54', '2020-07-26 22:33:01',
        'http://netvibes.com/posuere/nonummy/integer.png', 'kjXGWu', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-06 12:30:28', '2019-10-27 11:19:17', '2020-08-17 23:38:55',
        'https://topsy.com/a/odio/in/hac/habitasse/platea.js', 'fysR2oDx', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-23 01:32:30', '2019-02-19 22:25:56', '2020-12-09 07:19:13',
        'https://aboutads.info/vulputate/luctus/cum/sociis/natoque/penatibus.aspx', 'gokcnRkK', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-13 16:24:46', '2019-11-30 19:49:40', '2020-12-15 02:56:06',
        'https://apple.com/blandit/nam/nulla/integer/pede/justo/lacinia.aspx', 'XqwSNyzgzVi', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-24 21:29:53', '2019-03-28 16:53:21', '2020-12-01 20:48:25',
        'http://joomla.org/massa/tempor/convallis/nulla.js', 'upK4acI1', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-28 02:01:08', '2019-01-25 23:58:57', '2020-06-06 19:28:32',
        'https://cafepress.com/vestibulum.jsp', 'iG7DdHHMS6G', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-28 21:15:10', '2019-06-02 08:45:46', '2020-11-26 08:21:10',
        'https://smh.com.au/sit/amet.js', '9XYVUT', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-30 16:54:19', '2019-11-10 10:57:23', '2020-12-29 20:37:33',
        'https://weibo.com/tortor.aspx', 'zLmtUlf0MFn', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-01 18:17:13', '2019-01-29 03:07:29', '2020-02-28 07:09:45',
        'https://google.cn/justo/aliquam/quis/turpis/eget.jsp', 'tiWa3ivhl', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-18 08:46:12', '2019-04-12 03:47:03', '2020-04-16 23:23:07',
        'https://java.com/sapien/placerat/ante/nulla/justo.jsp', 'TaGgUUqiWB3w', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-28 00:53:36', '2019-06-12 13:47:54', '2020-04-18 06:04:56',
        'https://hatena.ne.jp/nunc/commodo/placerat/praesent/blandit/nam.jpg', 'F3qZyA', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-27 06:20:29', '2019-01-03 15:50:35', '2020-12-06 20:29:19',
        'http://simplemachines.org/non/lectus/aliquam/sit/amet.xml', 'ONnsgAFlo', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-28 02:29:12', '2019-06-06 05:36:29', '2020-05-22 16:20:58',
        'http://webmd.com/donec/vitae.png', 'QK2Bb0Y', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-17 00:35:25', '2019-01-09 07:39:00', '2020-01-31 03:03:26',
        'http://upenn.edu/est/phasellus/sit/amet/erat.jpg', 'ytKRwnrO', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-25 07:41:02', '2019-04-04 02:33:39', '2020-03-12 01:27:36',
        'https://google.fr/est/risus/auctor.xml', 'jjT311', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-09 07:30:13', '2019-04-22 22:10:28', '2020-03-28 10:22:49',
        'https://umich.edu/nibh/in.js', '7IFZBtlI', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-27 07:14:49', '2019-05-24 11:00:12', '2020-05-01 15:39:26',
        'http://webeden.co.uk/vivamus/in/felis/eu.xml', 'VLtjirE', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-12 09:12:33', '2019-09-24 13:23:38', '2020-04-14 17:47:24',
        'https://epa.gov/odio.jpg', '8IJHVOuje', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-09 18:33:13', '2019-08-10 20:48:03', '2020-06-05 07:40:24',
        'http://so-net.ne.jp/cras/in/purus/eu/magna.aspx', 'bkYSbfo', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-21 02:50:04', '2019-06-18 07:00:00', '2020-11-23 05:25:20',
        'https://walmart.com/id/nisl.xml', 'KG6iE23FRAGd', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-30 01:02:08', '2019-09-01 03:05:27', '2020-03-18 15:51:56',
        'https://storify.com/ipsum/primis/in.xml', '40vhzCs', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-21 06:36:08', '2019-09-14 10:11:59', '2020-07-08 12:09:05',
        'https://businessweek.com/etiam/vel.jsp', 'GViqVGg', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-03 07:47:43', '2019-02-18 02:11:45', '2020-09-23 12:49:01',
        'http://jalbum.net/proin/leo.js', '87v2sqpTup', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-20 02:11:54', '2019-12-28 00:18:38', '2020-03-12 09:54:56',
        'https://squarespace.com/tortor/eu/pede.xml', 'rH4wxi2Tlf9G', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-05 05:35:40', '2019-02-26 03:41:41', '2020-09-06 13:30:58',
        'http://ask.com/vestibulum.xml', '1wdCO46pBsD', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-02 17:40:28', '2019-02-21 18:45:34', '2020-03-13 18:36:37',
        'http://dropbox.com/lectus/pellentesque/at/nulla/suspendisse/potenti/cras.xml', 'nfYUsvGD', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-20 20:42:19', '2019-05-02 16:30:40', '2020-05-30 05:50:02',
        'http://wisc.edu/sed.jpg', 'NLmhN2Kvcq4', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-04 20:32:42', '2019-07-04 08:59:47', '2020-11-06 09:42:53',
        'https://irs.gov/hac/habitasse/platea/dictumst.jsp', 'RzZ0DlhVwL', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-13 12:58:27', '2019-06-20 21:42:42', '2020-03-15 15:56:01',
        'http://ehow.com/nulla/sed/vel/enim/sit/amet.png', 'QRRvrK2wFl3', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-12 20:09:59', '2019-11-13 06:45:36', '2020-04-12 18:58:38',
        'https://tamu.edu/sagittis/sapien/cum/sociis/natoque/penatibus/et.png', 'IePdJ3ngsW7', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-10 20:22:28', '2019-01-31 03:39:50', '2020-09-24 03:45:52',
        'https://sciencedaily.com/nunc/proin.html', '5TQ8Ni', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-20 14:13:56', '2019-08-02 16:27:01', '2020-12-24 12:06:39',
        'http://youtube.com/phasellus/in.xml', 'pv3h35x21', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-08 00:10:27', '2019-01-03 10:02:03', '2020-02-08 11:24:00',
        'http://taobao.com/at.jpg', 'Tu1Ng6', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-07 12:18:47', '2019-04-28 03:20:27', '2020-01-21 14:49:03',
        'http://domainmarket.com/dis.xml', 'qXHUMP', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-16 21:43:09', '2019-06-16 03:43:35', '2020-05-13 01:34:18',
        'http://homestead.com/ridiculus/mus/vivamus/vestibulum.html', 'bVcaMpAMIM', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-17 08:49:39', '2019-09-03 13:41:43', '2020-07-28 04:10:10',
        'https://woothemes.com/natoque/penatibus.jpg', 'EECHEBKs', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-15 22:43:20', '2019-09-22 19:08:00', '2020-09-13 04:54:31',
        'http://seattletimes.com/nunc/rhoncus/dui.jpg', 'wWmTJjhkxPBF', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-29 07:10:11', '2019-02-06 15:06:01', '2020-02-05 05:09:51',
        'https://buzzfeed.com/ornare/consequat/lectus/in/est/risus/auctor.aspx', 'q1IlM6ii8n', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-24 05:10:18', '2019-10-12 23:21:41', '2020-01-02 21:50:35',
        'http://lycos.com/cubilia/curae/nulla/dapibus/dolor/vel/est.js', 'UoKhRwB', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-08 17:53:50', '2019-09-03 10:03:29', '2020-08-22 09:04:28',
        'https://booking.com/erat/volutpat/in/congue.jpg', 'LLNXop9gpUNi', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-30 22:08:04', '2019-01-30 16:07:49', '2020-05-07 12:50:48',
        'https://naver.com/ac/est.png', 'ZCx4ms1bYk8g', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-18 15:04:00', '2019-04-21 09:10:00', '2020-04-04 11:11:48',
        'http://dailymotion.com/nec/molestie/sed/justo/pellentesque.jpg', '6QBJ6V', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-12 01:29:36', '2019-05-20 21:33:25', '2020-04-01 08:19:16',
        'http://issuu.com/hac/habitasse/platea.jsp', '2OEBEcbbu9pK', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-27 01:42:57', '2019-12-26 09:56:30', '2020-02-15 03:25:28',
        'http://zimbio.com/ac/consequat.aspx', 'b8V8sr2X1Fa', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-13 10:40:36', '2019-11-22 17:09:19', '2020-07-06 22:20:31',
        'http://bing.com/nulla/eget/eros.jpg', 'HNVz7UO2zLbl', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-14 22:30:28', '2019-03-19 09:16:34', '2020-04-02 20:04:48',
        'https://unicef.org/nulla/eget/eros/elementum/pellentesque.xml', 'J6Dp2sOC3FAX', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-16 13:26:28', '2019-12-27 21:20:17', '2020-01-19 08:57:28',
        'https://istockphoto.com/in/ante/vestibulum/ante.jsp', 'M3FxYCfcJX', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-01 13:33:28', '2019-04-14 13:20:00', '2020-03-12 13:26:37',
        'http://go.com/erat/fermentum/justo/nec/condimentum.aspx', 'TREyFbp4DI', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-10 12:05:22', '2019-11-09 07:49:49', '2020-07-19 13:13:38',
        'http://quantcast.com/nullam/molestie/nibh/in/lectus/pellentesque.xml', 'NiDsgZr', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-10 08:59:39', '2019-06-07 21:26:07', '2020-06-25 12:31:00',
        'https://cbslocal.com/suscipit/a.aspx', 'MhR7Un', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-15 00:54:26', '2019-02-19 06:04:18', '2020-12-22 04:55:43',
        'https://jalbum.net/sit/amet.json', 'KPkj3N8', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-25 21:27:03', '2019-08-21 02:09:44', '2020-11-19 02:19:05',
        'http://utexas.edu/amet.html', 'zJutQ37WbaWX', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-29 08:50:54', '2019-08-30 23:09:39', '2020-07-13 15:57:11',
        'https://a8.net/quam/sapien.html', 'O2fNcnk', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-27 06:50:37', '2019-08-03 13:24:17', '2020-11-20 18:32:58',
        'https://amazon.com/ante/ipsum/primis/in/faucibus/orci.aspx', 'VtmuMA6', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-06 10:43:48', '2019-01-28 01:01:59', '2020-08-07 04:43:20',
        'http://telegraph.co.uk/mi/pede/malesuada/in/imperdiet.json', '2KeeOCZ6Cx2h', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-11 13:41:53', '2019-11-29 07:42:44', '2020-01-12 04:04:15',
        'http://paginegialle.it/erat/nulla/tempus/vivamus/in/felis.aspx', 'KTylix', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-12 00:46:00', '2019-07-28 15:29:32', '2020-08-28 01:18:57',
        'https://ustream.tv/vel/nulla/eget/eros/elementum.png', 'VdwsBQr9Ocm', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-22 16:04:20', '2019-07-31 14:44:32', '2020-07-24 03:02:33',
        'https://princeton.edu/augue/a/suscipit/nulla.jsp', 'vkWcZY', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-23 08:46:58', '2019-11-06 12:42:28', '2020-09-14 05:11:26',
        'http://sphinn.com/integer.png', 'Pb7KfA3ytXd', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-28 04:30:39', '2019-07-15 14:26:23', '2020-07-04 07:15:30',
        'http://yahoo.com/dolor.jpg', 'R1OfLF1Z', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-30 19:10:00', '2019-01-07 08:50:10', '2020-04-18 20:42:07',
        'https://hatena.ne.jp/lacus/purus/aliquet/at/feugiat/non/pretium.xml', '5rqdY9e3kt7x', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-04 20:31:49', '2019-06-13 20:13:57', '2020-11-10 16:05:09',
        'http://addthis.com/est/congue/elementum/in.aspx', 'd4ulMk', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-06 14:13:01', '2019-12-26 04:14:49', '2020-05-11 18:16:40',
        'https://bravesites.com/scelerisque/mauris/sit/amet.png', 'JcmyNvPA', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-06 05:19:22', '2019-03-20 03:39:53', '2020-01-28 18:39:13',
        'https://fastcompany.com/turpis/sed/ante/vivamus.jpg', 'BCd6rGjeUetS', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-10 02:09:29', '2019-10-13 01:04:28', '2020-05-06 05:37:51',
        'http://sakura.ne.jp/id/consequat/in/consequat/ut.xml', '29JvZEj', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-22 19:51:34', '2019-06-16 12:31:49', '2020-03-05 18:22:14',
        'http://arstechnica.com/nisl.png', 'od89ioOVlLP1', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-02 23:48:30', '2019-03-13 18:42:53', '2020-07-22 09:06:40',
        'https://icio.us/nisi/venenatis/tristique/fusce.jsp', 'zAVCxFn6PX', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-18 03:15:40', '2019-07-07 14:08:42', '2020-08-28 20:20:42',
        'http://gov.uk/semper.jpg', 'Qruf15SV', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-26 23:57:00', '2019-09-11 20:54:58', '2020-08-08 16:22:10',
        'http://house.gov/nonummy/maecenas.json', 'uJ6bHJwc', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-08 17:39:47', '2019-05-29 13:25:05', '2020-11-14 12:50:21',
        'https://cocolog-nifty.com/montes/nascetur/ridiculus/mus.png', 'pCLfRG', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-21 21:22:08', '2019-04-14 16:37:17', '2020-04-07 01:10:18',
        'http://arstechnica.com/sapien/ut/nunc/vestibulum.js', 'gnNOfvNGLh', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-10 17:51:30', '2019-03-15 13:39:01', '2020-05-28 08:46:56',
        'https://photobucket.com/vestibulum/velit/id/pretium/iaculis/diam.html', 'fie9zRl2', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-27 12:12:05', '2019-10-17 13:56:46', '2020-09-20 10:52:26',
        'https://boston.com/penatibus/et/magnis/dis.json', 'Z8xwUOkvT', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-22 09:58:18', '2019-03-10 07:12:50', '2020-04-12 20:32:01',
        'http://tiny.cc/diam/neque/vestibulum/eget.jsp', 'T031aMc', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-10 17:38:04', '2019-08-06 15:25:27', '2020-06-25 08:15:19',
        'http://4shared.com/amet/consectetuer/adipiscing/elit.jsp', 'kdL1M5n', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-06 20:05:46', '2019-11-02 03:31:20', '2020-06-25 08:39:02',
        'https://de.vu/ipsum/integer/a.js', 'Xs2zvJpPg', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-05 13:38:33', '2019-11-27 19:31:32', '2020-10-05 20:44:46',
        'http://bing.com/tellus/semper/interdum/mauris.jpg', 'DZq4h7Iu', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-13 10:24:02', '2019-07-20 04:20:17', '2020-06-28 13:19:57',
        'https://mediafire.com/non/interdum/in/ante/vestibulum/ante/ipsum.jsp', 'ix3SMPI', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-10 22:39:57', '2019-06-03 22:48:03', '2020-01-31 10:20:11',
        'https://nyu.edu/eleifend/donec/ut/dolor/morbi/vel.aspx', 'VzBASrKb9D', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-15 16:46:36', '2019-02-03 05:16:29', '2020-03-13 18:46:12',
        'https://sogou.com/dictumst/etiam/faucibus/cursus/urna/ut/tellus.png', 'TKP6xWZ', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-04 03:21:27', '2019-04-24 08:24:28', '2020-01-08 14:17:27',
        'http://123-reg.co.uk/risus/semper/porta/volutpat.jpg', 'QTV1z4GNLe', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-07-25 12:35:43', '2019-08-09 10:06:43', '2020-06-12 05:33:05',
        'http://php.net/nunc/donec/quis/orci/eget/orci/vehicula.html', 'fML0dJHRjc', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-14 01:32:26', '2019-08-03 04:17:26', '2020-11-18 13:05:32',
        'http://mapquest.com/ultrices/erat.html', 'Oy8W55Fr', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-13 20:38:28', '2019-08-23 01:23:25', '2020-10-04 06:12:12',
        'https://elegantthemes.com/leo/odio/condimentum/id.png', 'K5b5CMX', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-27 01:24:33', '2019-12-02 04:07:59', '2020-07-26 02:21:15',
        'https://google.ru/mauris/morbi/non/lectus/aliquam/sit.xml', 'ybAR7y9Qea', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-17 17:32:07', '2019-12-24 02:03:57', '2020-04-04 15:16:32',
        'https://shareasale.com/luctus/et/ultrices/posuere.jpg', '78PHNfUl6', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-05 01:40:38', '2019-11-26 03:14:45', '2020-04-20 10:00:24',
        'https://shareasale.com/nulla/sed/accumsan/felis.jsp', 'lpC8YEBgQf', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-04 11:54:45', '2019-11-11 21:42:32', '2020-05-05 08:57:57',
        'https://bloomberg.com/velit/vivamus/vel/nulla/eget/eros/elementum.aspx', 'g4aIBE7I3eV6', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-08 02:31:36', '2019-07-09 13:01:14', '2020-10-18 16:49:43',
        'http://issuu.com/nam/nulla.json', 'qb8Uoq67', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-10 20:30:01', '2019-04-27 02:25:27', '2020-03-06 12:24:10',
        'https://cargocollective.com/luctus/rutrum/nulla/tellus.aspx', '8mB8LvrMU', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-27 19:33:44', '2019-04-18 22:49:53', '2020-09-26 07:55:04',
        'https://globo.com/tempus/sit/amet.js', '0IgNUCVkb', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-11 19:06:18', '2019-12-18 04:57:36', '2020-07-08 08:15:28',
        'http://youtu.be/nascetur/ridiculus.jpg', '19GYmsK', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-25 10:22:49', '2019-04-02 00:43:08', '2020-08-22 15:48:53',
        'https://state.tx.us/at/diam/nam/tristique/tortor/eu/pede.html', 'xvl6wQr9Uli', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-12 21:51:11', '2019-11-18 20:33:08', '2020-09-14 14:27:19',
        'https://multiply.com/felis/sed/interdum/venenatis/turpis.xml', 'y9xzpwtVvu', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-09-13 17:21:22', '2019-01-16 14:59:00', '2020-03-17 22:15:28',
        'https://is.gd/arcu/libero/rutrum/ac/lobortis.html', 'PPR3YR', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-01-24 16:55:51', '2019-07-19 01:31:33', '2020-07-19 06:19:06',
        'http://jiathis.com/fermentum/donec/ut/mauris/eget.html', 'vfaLlAg', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-07 02:15:27', '2019-10-28 10:26:14', '2020-11-18 17:28:37',
        'http://gmpg.org/proin/interdum/mauris/non.aspx', 'Aj3HRHa7xvAX', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-06-30 07:41:07', '2019-02-27 13:04:38', '2020-03-01 07:32:19',
        'https://davidkroell.github.io', 'asdf', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-23 06:29:44', '2019-11-06 19:14:04', '2020-11-12 02:11:31',
        'https://boston.com/at/nulla/suspendisse.jpg', 'CrAp1bD67', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-22 14:54:46', '2019-07-09 07:01:02', '2020-03-23 06:01:15',
        'https://google.ru/luctus/et.xml', 'JJl8dROA', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-12-31 01:19:53', '2019-02-08 08:44:44', '2020-08-10 00:44:46',
        'http://live.com/ac/leo/pellentesque/ultrices/mattis.xml', 'gvO3sGoNAO', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-08-08 17:44:21', '2019-12-31 15:08:41', '2020-01-07 10:44:11',
        'https://quantcast.com/turpis/donec/posuere/metus/vitae/ipsum.js', 'CyDNi9t', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-11-28 07:05:47', '2019-07-28 19:05:15', '2020-03-26 19:35:27',
        'http://addtoany.com/condimentum/curabitur.aspx', '8qLigYEmR', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-17 10:46:14', '2019-11-02 21:16:03', '2020-04-05 19:44:03',
        'http://ebay.co.uk/elementum/in/hac/habitasse.js', 'XmjGViXEM', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-05-24 10:53:30', '2019-08-11 08:52:25', '2020-05-30 00:04:57',
        'https://toplist.cz/mattis/odio/donec/vitae.html', 'tCCwjdC', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-03-15 11:35:05', '2019-01-05 11:16:20', '2020-05-17 12:07:32',
        'http://google.com/est/phasellus.js', 'qytK1G', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-26 16:24:10', '2019-05-07 05:44:04', '2020-05-14 00:34:17',
        'http://altervista.org/eu/sapien/cursus.jsp', 'a0Fzxyi', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-04 15:27:56', '2019-03-28 17:49:42', '2020-12-10 19:52:31',
        'https://flickr.com/sed/augue/aliquam/erat/volutpat/in/congue.jpg', 'nV3vLNH', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-04-26 01:48:19', '2019-10-25 17:57:22', '2020-07-27 02:24:49',
        'http://wiley.com/adipiscing.xml', '6wcFjv6YJE', 301, (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-10-13 17:15:25', '2019-11-15 19:01:57', '2020-09-09 04:46:46',
        'https://zdnet.com/in/tempus/sit/amet/sem/fusce/consequat.jsp', '5Vn99F', 301,
        (SELECT ID FROM Users ORDER BY RAND() LIMIT 1));
insert into Shortcuts (CreatedAt, UpdatedAt, ValidThru, RedirectURL, ShortIdentifier, RedirectStatus, UserID)
values ('2018-02-07 02:06:29', '2019-05-26 15:48:25', '2020-07-03 11:07:57',
        'http://cloudflare.com/cursus/id/turpis/integer/aliquet.jpg', 'U6gIdTw', 301,
        11);

