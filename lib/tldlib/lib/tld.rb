#!/usr/bin/env ruby
# This is TLD version 0.2

=begin
TLD.rb is a library (Ruby module) for looking up top level domains.
Copyright (C) 2003 Josef 'Jupp' Schugt <jupp@rubyforge.org>

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2 of the License, or (at your
option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
=end
module TLD

  # Hash of all country-code TLDs in use
  Country =
  {
    'ac' => 'Ascension Island',
    'ad' => 'Andorra',
    'ae' => 'United Arab Emirates',
    'af' => 'Afghanistan',
    'ag' => 'Antigua and Barbuda',
    'ai' => 'Anguilla',
    'al' => 'Albania',
    'am' => 'Armenia',
    'an' => 'Netherland Antilles',
    'ao' => 'Angola',
    'aq' => 'Antarctica',
    'ar' => 'Argentina',
    'as' => 'American Samoa',
    'at' => 'Austria',
    'au' => 'Australia',
    'aw' => 'Aruba',
    'az' => 'Azerbaidjan',
    'ba' => 'Bosnia and Herzegovina',
    'bb' => 'Barbados',
    'bd' => 'Bangladesh',
    'be' => 'Belgium',
    'bf' => 'Burkina Faso',
    'bg' => 'Bulgaria',
    'bh' => 'Bahrain',
    'bi' => 'Burundi',
    'bj' => 'Benin',
    'bm' => 'Bermuda',
    'bn' => 'Brunei Darussalam',
    'bo' => 'Bolivia',
    'br' => 'Brazil',
    'bs' => 'Bahamas',
    'bt' => 'Bhutan',
    'bv' => 'Bouvet Island',
    'bw' => 'Botswana',
    'by' => 'Belarus',
    'bz' => 'Belize',
    'ca' => 'Canada',
    'cc' => 'Cocos (Keeling) Islands',
    'cd' => 'Congo, The Democratic Republic of the',
    'cf' => 'Central African Republic',
    'cg' => 'Congo',
    'ch' => 'Switzerland',
    'ci' => 'Cote D\'Ivoire',
    'ck' => 'Cook Islands',
    'cl' => 'Chile',
    'cm' => 'Cameroon',
    'cn' => 'China',
    'co' => 'Colombia',
    'cr' => 'Costa Rica',
    'cu' => 'Cuba',
    'cv' => 'Cape Verde',
    'cx' => 'Christmas Island',
    'cy' => 'Cyprus',
    'cz' => 'Czech Republic',
    'de' => 'Germany',
    'dj' => 'Djibouti',
    'dk' => 'Denmark',
    'dm' => 'Dominica',
    'do' => 'Dominican Republic',
    'dz' => 'Algeria',
    'ec' => 'Ecuador',
    'ee' => 'Estonia',
    'eg' => 'Egypt',
    'eh' => 'Western Sahara',
    'er' => 'Eritrea',
    'es' => 'Spain',
    'et' => 'Ethiopia',
    'fi' => 'Finland',
    'fj' => 'Fiji',
    'fk' => 'Falkland Islands (Malvinas)',
    'fm' => 'Micronesia, Federated States of',
    'fo' => 'Faroe Islands',
    'fr' => 'France',
    'ga' => 'Gabon',
    'gb' => 'United Kingdom (of Great Britain and Northern Ireland)',
    'gd' => 'Grenada',
    'ge' => 'Georgia',
    'gf' => 'French Guiana',
    'gg' => 'Guernsey',
    'gh' => 'Ghana',
    'gi' => 'Gibraltar',
    'gl' => 'Greenland',
    'gm' => 'Gambia',
    'gn' => 'Guinea',
    'gp' => 'Guadeloupe',
    'gq' => 'Equatorial Guinea',
    'gr' => 'Greece',
    'gs' => 'South Georgia and South Sandwich Islands',
    'gt' => 'Guatemala',
    'gu' => 'Guam',
    'gw' => 'Guinea-Bissau',
    'gy' => 'Guyana',
    'hk' => 'Hong Kong',
    'hm' => 'Heard Island and McDonald Islands',
    'hn' => 'Honduras',
    'hr' => 'Croatia',
    'ht' => 'Haiti',
    'hu' => 'Hungary',
    'id' => 'Indonesia',
    'ie' => 'Ireland',
    'il' => 'Israel',
    'im' => 'Isle of Man',
    'in' => 'India',
    'io' => 'British Indian Ocean Territory',
    'iq' => 'Iraq',
    'ir' => 'Iran, Islamic Republic of',
    'is' => 'Iceland',
    'it' => 'Italy',
    'je' => 'Jersey',
    'jm' => 'Jamaica',
    'jo' => 'Jordan',
    'jp' => 'Japan',
    'ke' => 'Kenya',
    'kg' => 'Kyrgyzstan',
    'kh' => 'Cambodia',
    'ki' => 'Kiribati',
    'km' => 'Comoros',
    'kn' => 'Saint Kitts and Nevis',
    'kp' => 'Korea, Democratic People\'s Republic of (North Korea)',
    'kr' => 'Korea, Republic of (South Korea)',
    'kw' => 'Kuwait',
    'ky' => 'Cayman Islands',
    'kz' => 'Kazakstan',
    'la' => 'Lao People\'s Democratic Republic (Laos)',
    'lb' => 'Lebanon',
    'lc' => 'Saint Lucia',
    'li' => 'Liechtenstein',
    'lk' => 'Sri Lanka',
    'lr' => 'Liberia',
    'ls' => 'Lesotho',
    'lt' => 'Lithuania',
    'lu' => 'Luxembourg',
    'lv' => 'Latvia',
    'ly' => 'Libyan Arab Jamhiriya (Libya)',
    'ma' => 'Morocco',
    'mc' => 'Monaco',
    'md' => 'Moldova, Republic of',
    'mg' => 'Madagascar',
    'mh' => 'Marshall Islands',
    'mk' => 'Macedonia (former Yugoslavia)',
    'ml' => 'Mali',
    'mm' => 'Myanmar',
    'mn' => 'Mongolia',
    'mo' => 'Macau',
    'mp' => 'Northern Mariana Islands',
    'mq' => 'Martinique',
    'mr' => 'Mauritania',
    'ms' => 'Montserrat',
    'mt' => 'Malta',
    'mu' => 'Mauritius',
    'mv' => 'Maldives',
    'mw' => 'Malawi',
    'mx' => 'Mexico',
    'my' => 'Malaysia',
    'mz' => 'Mozambique',
    'na' => 'Namibia',
    'nc' => 'New Caledonia',
    'ne' => 'Niger',
    'nf' => 'Norfolk Island',
    'ng' => 'Nigeria',
    'ni' => 'Nicaragua',
    'nl' => 'Netherlands',
    'no' => 'Norway',
    'np' => 'Nepal',
    'nr' => 'Nauru',
    'nu' => 'Niue',
    'nz' => 'New Zealand',
    'om' => 'Oman',
    'pa' => 'Panama',
    'pe' => 'Peru',
    'pf' => 'French Polynesia',
    'pg' => 'Papua New Guinea',
    'ph' => 'Philippines',
    'pk' => 'Pakistan',
    'pl' => 'Poland',
    'pm' => 'Saint Pierre and Miquelon',
    'pn' => 'Pitcairn',
    'pr' => 'Puerto Rico',
    'ps' => 'Palestinian Territory, Occupied',
    'pt' => 'Portugal',
    'pw' => 'Palau',
    'py' => 'Paraguay',
    'qa' => 'Qatar',
    're' => 'Reunion',
    'ro' => 'Romania',
    'ru' => 'Russian Federation',
    'rw' => 'Rwanda',
    'sa' => 'Saudi Arabia',
    'sb' => 'Solomon Islands',
    'sc' => 'Seychelles',
    'sd' => 'Sudan',
    'se' => 'Sweden',
    'sg' => 'Singapore',
    'sh' => 'Saint Helena',
    'si' => 'Slovenia',
    'sj' => 'Svalbard and Jan Mayen',
    'sk' => 'Slovakia',
    'sl' => 'Sierra Leone',
    'sm' => 'San Marino',
    'sn' => 'Senegal',
    'so' => 'Somalia',
    'sr' => 'Suriname',
    'st' => 'Sao Tome and Principe',
    'su' => 'Soviet Union (still in use)',
    'sv' => 'El Salvador',
    'sy' => 'Syrian Arab Republic (Syria)',
    'sz' => 'Swaziland',
    'tc' => 'Turks and Caicos Islands',
    'td' => 'Chad',
    'tf' => 'French Southern Territories',
    'tg' => 'Togo',
    'th' => 'Thailand',
    'tj' => 'Tadjikistan',
    'tk' => 'Tokelau',
    'tm' => 'Turkmenistan',
    'tn' => 'Tunisia',
    'to' => 'Tonga',
    'tp' => 'East Timor',
    'tr' => 'Turkey',
    'tt' => 'Trinidad and Tobago',
    'tv' => 'Tuvalu',
    'tw' => 'Taiwan, Republic of China',
    'tz' => 'Tanzania, United Republic of',
    'ua' => 'Ukraine',
    'ug' => 'Uganda',
    'uk' => 'United Kingdom',
    'um' => 'United States Minor outlying Islands',
    'us' => 'United States',
    'uy' => 'Uruguay',
    'uz' => 'Uzbekistan',
    'va' => 'Holy See (Vatican City State)',
    'vc' => 'Saint Vincent and the Grenadines',
    've' => 'Venezuela',
    'vg' => 'Virgin Islands, British',
    'vi' => 'Virgin Islands, U.S.',
    'vn' => 'Vietnam',
    'vu' => 'Vanuatu',
    'wf' => 'Wallis and Futuna',
    'ws' => 'Western Samoa',
    'ye' => 'Yemen',
    'yt' => 'Mayotte',
    'yu' => 'Yugoslavia',
    'za' => 'South Africa',
    'zm' => 'Zambia',
    'zw' => 'Zimbabwe'
  }

  # Hash of all old non-country TLDs
  Noncountry_old =
  {
    'arpa' => 'Reverse mapping in IPv4 space',
    'com'  => 'Commercial',
    'edu'  => 'Educational',
    'gov'  => 'Government',
    'int'  => 'International field',
    'mil'  => 'US Military',
    'net'  => 'Network',
    'org'  => 'Non-Profit Organization',
  }

  # Hash of all new non-country TLDs
  Noncountry_new =
  {
    'aero'   => 'Air Transport Industry',
    'biz'    => 'Businesses',
    'coop'   => 'Non-profit cooperatives',
    'info'   => 'Unrestricted Use',
    'museum' => 'Museums',
    'name'   => 'Individuals',
    'pro'    => 'Accountants, lawyers and physicians',
  }

  # Hash of all non-country TLDs
  Noncountry = {}.update(Noncountry_old).update(Noncountry_new)

  # Hash of all valid TLDs
  All = {}.update(Country).update(Noncountry)

  # Hash of RFC 2606 TLDs
  RFC_2606 = {
    'example'   => 'Documentation or examples',
    'invalid'   => 'Domain names that are surely and obviously invalid',
    'localhost' => 'Loop back IP address',
    'test'      => 'Testing of DNS related code'
  }

  # BCP 32 and RFC 2606 are identical
  BCP_32 = RFC_2606

  # Is tld a valid TLD?
  def TLD::valid?(tld)
    All.member?(tld)
  end

  # Is tld a country-code TLD?
  def TLD::country?(tld)
    Country.member?(tld)
  end

  # Is tld a non-country TLD?
  def TLD::noncountry?(tld)
    Noncountry.member?(tld)
  end

  # Is tld an old non-country TLD?
  def TLD::noncountry_old?(tld)
    Noncountry_old.member?(tld)
  end

  # Is tld a new non-country TLD?
  def TLD::noncountry_new?(tld)
    Noncountry_new.member?(tld)
  end

  # Is tld an RFC 2606 TLD?
  def TLD::rfc_2606?(tld)
    RFC_2606.member?(tld)
  end

  # Is tld a BCP 32 TLD?
  def TLD::bcp_32?(tld)
    BCP_32.member?(tld)
  end

end
