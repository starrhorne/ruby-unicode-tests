require 'sinatra'

get '/' do

  @tests = [
    {
      name: 'String#%',
      code: %["%s" % "noe\u0308l"],
      expected: %[noe\u0308l]
    },
    {
      name: 'String#*',
      code: %["noe\u0308l" * 2],
      expected: %[noe\u0308lnoe\u0308l]
    },
    {
      name: 'String#<<',
      code: %["noe\u0308l" << "e\u0308"],
      expected: %[noe\u0308le\u0308]
    },
    {
      name: 'String#<=>',
      code: %["a\u0308" <=> "z"],
      expected: -1
    },
    {
      name: 'String#==',
      code: %["a\u0308" == "a\u0308"],
      expected: true
    },
    {
      name: 'String#=~',
      code: %["a\u0308" =~ /a./],
      expected: nil
    },
    {
      name: 'String#[]',
      code: %["a\u0308"\[0\]],
      expected: %[a\u0308]
    },
    {
      name: 'String#[]=',
      code: %["a\u0308"\[0\] = "u"],
      expected: %[u]
    },
    {
      name: 'String#b',
      code: %["a\u0308".b.encoding.to_s],
      expected: "ASCII-8BIT"
    },
    {
      name: 'String#bytes',
      code: %["a\u0308".bytes],
      expected: [97, 204, 136]
    },
    {
      name: 'String#bytesize',
      code: %["a\u0308".bytesize],
      expected: 3
    },
    {
      name: 'String#byteslice',
      code: %["a\u0308".byteslice(1)],
      expected: "\xCC"
    },
    {
      name: 'String#capitalize',
      code: %["a\u0308".capitalize],
      expected: %[A\u0308]
    },
    {
      name: 'String#casecmp',
      code: %["a\u0308a".casecmp("a\u0308z")],
      expected: -1
    },
    {
      name: 'String#center',
      code: %["a\u0308".center(3)],
      expected: " a\u0308 " 
    },
    {
      name: 'String#chars',
      code: %["a\u0308".chars],
      expected: ["a\u0308"] 
    },
    {
      name: 'String#chomp',
      code: %["a\u0308\n".chomp],
      expected: "a\u0308",
      notes: "Chomp can mangle unicode by removing individual bytes: `\"a\\u0308\".chomp(\"\\x88\")` will result in an exception"
    },
    {
      name: 'String#chop',
      code: %["a\u0308".chop],
      expected: "",
    },
    {
      name: 'String#chr',
      code: %["a\u0308".chr],
      expected: "a\u0308",
    },
    {
      name: 'String#clear',
      code: %["a\u0308".clear],
      expected: "",
    },
    {
      name: 'String#codepoints',
      code: %["a\u0308".codepoints],
      expected: [97, 776],
    },
    {
      name: 'String#concat',
      code: %["a\u0308".concat("x")],
      expected: "a\u0308x",
    },
    {
      name: 'String#count',
      code: %["a\u0308".count("a")],
      expected: 0,
    },
    {
      name: 'String#crypt',
      code: %["123".crypt("a\u0308a\u0308") == "123".crypt("aa")],
      expected: false,
    },
    {
      name: 'String#delete',
      code: %["a\u0308".delete("a")],
      expected: "a\u0308",
    },
    {
      name: 'String#downcase',
      code: %["A\u0308".downcase],
      expected: "a\u0308",
    },
    {
      name: 'String#dump',
      code: %["a\u0308".dump],
      expected: "\"a\\u0308\"",
    },
    {
      name: 'String#each_byte',
      code: %["a\u0308".each_byte.to_a],
      expected: [97, 204, 136]
    },
    {
      name: 'String#each_char',
      code: %["a\u0308".each_char.to_a],
      expected: ["a\u0308"]
    },
    {
      name: 'String#each_codepoint',
      code: %["a\u0308".each_codepoint.to_a],
      expected: [97, 776],
    },
    {
      name: 'String#each_line',
      code: %["a\u0308".each_line.to_a],
      expected: ["a\u0308"],
    },
    {
      name: 'String#empty?',
      code: %["a\u0308".empty?],
      expected: false
    },
    {
      name: 'String#encode',
      code: %["a\u0308".encode("ASCII", undef: :replace)],
      expected: "a?",
      notes: "The whole point of this method is to work with encodings, so we really just include it for completeness"
    },
    {
      name: 'String#encoding',
      code: %["a\u0308".encoding.to_s],
      expected: "UTF-8"
    },
    {
      name: 'String#end_with?',
      code: %["a\u0308".end_with?("a\u0308")],
      expected: true
    },
    {
      name: 'String#eql?',
      code: %["a\u0308".eql?("a")],
      expected: false
    },
    {
      name: 'String#force_encoding',
      code: %["a\u0308".force_encoding("ASCII")],
      expected: "a\xCC\x88".force_encoding("ASCII")
    },
    {
      name: 'String#getbyte',
      code: %["a\u0308".getbyte(2)],
      expected: 136
    },
    {
      name: 'String#gsub',
      code: %["a\u0308".gsub("a", "x")],
      expected: "a\u0308"
    },
    {
      name: 'String#hash',
      code: %["a\u0308".hash == "a".hash],
      expected: false
    },
    {
      name: 'String#include?',
      code: %["a\u0308".include?("a")],
      expected: false
    },
    {
      name: 'String#index',
      code: %["a\u0308".index("a")],
      expected: nil
    },
    {
      name: 'String#replace',
      code: %["a\u0308".replace("u")],
      expected: "u"
    },
    {
      name: 'String#insert',
      code: %["a\u0308".insert(1, "u")],
      expected: "a\u0308u"
    },
    {
      name: 'String#inspect',
      code: %["a\u0308".inspect],
      expected: "\"a\u0308\""
    },
    {
      name: 'String#intern',
      code: %["a\u0308".intern],
      expected: :"a\u0308"
    },
    {
      name: 'String#length',
      code: %["a\u0308".length],
      expected: 1
    },
    {
      name: 'String#ljust',
      code: %["a\u0308".ljust(3, "_")],
      expected: "a\u0308__"
    },
    {
      name: 'String#lstrip',
      code: %["  a\u0308".lstrip],
      expected: "a\u0308"
    },
    {
      name: 'String#match',
      code: %["a\u0308".match("a")],
      expected: nil
    },
    {
      name: 'String#next',
      code: %["a\u0308".next],
      expected: "a\u0308"
    },
    {
      name: 'String#ord',
      code: %["a\u0308".ord],
      expected: 97
    },
    {
      name: 'String#partition',
      code: %["ha\u0308nd".partition("a")],
      expected: ["ha\u0308nd"] 
    },
  ]

  erb :index
end
