library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_rom2 is
generic	(
	ADDR_WIDTH : integer := 14; -- ROM's address width (words, not bytes)
	COL_WIDTH  : integer := 8;  -- Column width (8bit -> byte)
	NB_COL     : integer := 4  -- Number of columns in memory
	);
port (
	clk : in std_logic;
	reset_n : in std_logic := '1';
	addr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	q : out std_logic_vector(31 downto 0);
	-- Allow writes - defaults supplied to simplify projects that don't need to write.
	d : in std_logic_vector(31 downto 0) := X"00000000";
	we : in std_logic := '0';
	bytesel : in std_logic_vector(3 downto 0) := "1111"
);
end entity;

architecture arch of controller_rom2 is

-- type word_t is std_logic_vector(31 downto 0);
type ram_type is array (0 to 2 ** ADDR_WIDTH - 1) of std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);

signal ram : ram_type :=
(

     0 => x"04047c7c",
     1 => x"0000787c",
     2 => x"44447c38",
     3 => x"0000387c",
     4 => x"2424fcfc",
     5 => x"0000183c",
     6 => x"24243c18",
     7 => x"0000fcfc",
     8 => x"04047c7c",
     9 => x"0000080c",
    10 => x"54545c48",
    11 => x"00002074",
    12 => x"447f3f04",
    13 => x"00000044",
    14 => x"40407c3c",
    15 => x"00007c7c",
    16 => x"60603c1c",
    17 => x"3c001c3c",
    18 => x"6030607c",
    19 => x"44003c7c",
    20 => x"3810386c",
    21 => x"0000446c",
    22 => x"60e0bc1c",
    23 => x"00001c3c",
    24 => x"5c746444",
    25 => x"0000444c",
    26 => x"773e0808",
    27 => x"00004141",
    28 => x"7f7f0000",
    29 => x"00000000",
    30 => x"3e774141",
    31 => x"02000808",
    32 => x"02030101",
    33 => x"7f000102",
    34 => x"7f7f7f7f",
    35 => x"08007f7f",
    36 => x"3e1c1c08",
    37 => x"7f7f7f3e",
    38 => x"1c3e3e7f",
    39 => x"0008081c",
    40 => x"7c7c1810",
    41 => x"00001018",
    42 => x"7c7c3010",
    43 => x"10001030",
    44 => x"78606030",
    45 => x"4200061e",
    46 => x"3c183c66",
    47 => x"78004266",
    48 => x"c6c26a38",
    49 => x"6000386c",
    50 => x"00600000",
    51 => x"0e006000",
    52 => x"5d5c5b5e",
    53 => x"4c711e0e",
    54 => x"bffdeec2",
    55 => x"c04bc04d",
    56 => x"02ab741e",
    57 => x"a6c487c7",
    58 => x"c578c048",
    59 => x"48a6c487",
    60 => x"66c478c1",
    61 => x"ee49731e",
    62 => x"86c887df",
    63 => x"ef49e0c0",
    64 => x"a5c487ef",
    65 => x"f0496a4a",
    66 => x"c6f187f0",
    67 => x"c185cb87",
    68 => x"abb7c883",
    69 => x"87c7ff04",
    70 => x"264d2626",
    71 => x"264b264c",
    72 => x"4a711e4f",
    73 => x"5ac1efc2",
    74 => x"48c1efc2",
    75 => x"fe4978c7",
    76 => x"4f2687dd",
    77 => x"711e731e",
    78 => x"aab7c04a",
    79 => x"c287d303",
    80 => x"05bff8d3",
    81 => x"4bc187c4",
    82 => x"4bc087c2",
    83 => x"5bfcd3c2",
    84 => x"d3c287c4",
    85 => x"d3c25afc",
    86 => x"c14abff8",
    87 => x"a2c0c19a",
    88 => x"87e8ec49",
    89 => x"d3c248fc",
    90 => x"fe78bff8",
    91 => x"711e87ef",
    92 => x"1e66c44a",
    93 => x"f9ea4972",
    94 => x"4f262687",
    95 => x"ff4a711e",
    96 => x"ffc348d4",
    97 => x"48d0ff78",
    98 => x"ff78e1c0",
    99 => x"78c148d4",
   100 => x"31c44972",
   101 => x"d0ff7871",
   102 => x"78e0c048",
   103 => x"c21e4f26",
   104 => x"49bff8d3",
   105 => x"c287f9e6",
   106 => x"e848f5ee",
   107 => x"eec278bf",
   108 => x"bfec48f1",
   109 => x"f5eec278",
   110 => x"c3494abf",
   111 => x"b7c899ff",
   112 => x"7148722a",
   113 => x"fdeec2b0",
   114 => x"0e4f2658",
   115 => x"5d5c5b5e",
   116 => x"ff4b710e",
   117 => x"eec287c8",
   118 => x"50c048f0",
   119 => x"dfe64973",
   120 => x"4c497087",
   121 => x"eecb9cc2",
   122 => x"87d4cc49",
   123 => x"c24d4970",
   124 => x"bf97f0ee",
   125 => x"87e2c105",
   126 => x"c24966d0",
   127 => x"99bff9ee",
   128 => x"d487d605",
   129 => x"eec24966",
   130 => x"0599bff1",
   131 => x"497387cb",
   132 => x"7087ede5",
   133 => x"c1c10298",
   134 => x"fe4cc187",
   135 => x"497587c0",
   136 => x"7087e9cb",
   137 => x"87c60298",
   138 => x"48f0eec2",
   139 => x"eec250c1",
   140 => x"05bf97f0",
   141 => x"c287e3c0",
   142 => x"49bff9ee",
   143 => x"059966d0",
   144 => x"c287d6ff",
   145 => x"49bff1ee",
   146 => x"059966d4",
   147 => x"7387caff",
   148 => x"87ece449",
   149 => x"fe059870",
   150 => x"487487ff",
   151 => x"0e87fafa",
   152 => x"5d5c5b5e",
   153 => x"c086f80e",
   154 => x"bfec4c4d",
   155 => x"48a6c47e",
   156 => x"bffdeec2",
   157 => x"c01ec178",
   158 => x"fd49c71e",
   159 => x"86c887cd",
   160 => x"cd029870",
   161 => x"fa49ff87",
   162 => x"dac187ea",
   163 => x"87f0e349",
   164 => x"eec24dc1",
   165 => x"02bf97f0",
   166 => x"d3c287cf",
   167 => x"c149bfe0",
   168 => x"e4d3c2b9",
   169 => x"d3fb7159",
   170 => x"f5eec287",
   171 => x"d3c24bbf",
   172 => x"c105bff8",
   173 => x"a6c487d9",
   174 => x"c0c0c848",
   175 => x"e4d3c278",
   176 => x"bf976e7e",
   177 => x"c1486e49",
   178 => x"717e7080",
   179 => x"7087f1e2",
   180 => x"87c30298",
   181 => x"c4b366c4",
   182 => x"b7c14866",
   183 => x"58a6c828",
   184 => x"ff059870",
   185 => x"fdc387db",
   186 => x"87d4e249",
   187 => x"e249fac3",
   188 => x"497387ce",
   189 => x"7199ffc3",
   190 => x"f949c01e",
   191 => x"497387f0",
   192 => x"7129b7c8",
   193 => x"f949c11e",
   194 => x"86c887e4",
   195 => x"c287fac5",
   196 => x"4bbff9ee",
   197 => x"87dd029b",
   198 => x"bff4d3c2",
   199 => x"87ecc749",
   200 => x"c4059870",
   201 => x"d24bc087",
   202 => x"49e0c287",
   203 => x"c287d1c7",
   204 => x"c658f8d3",
   205 => x"f4d3c287",
   206 => x"7378c048",
   207 => x"0599c249",
   208 => x"ebc387ce",
   209 => x"87f8e049",
   210 => x"99c24970",
   211 => x"87c2c002",
   212 => x"49734cfb",
   213 => x"ce0599c1",
   214 => x"49f4c387",
   215 => x"7087e1e0",
   216 => x"0299c249",
   217 => x"fa87c2c0",
   218 => x"c849734c",
   219 => x"87cd0599",
   220 => x"e049f5c3",
   221 => x"497087ca",
   222 => x"d60299c2",
   223 => x"c1efc287",
   224 => x"cac002bf",
   225 => x"88c14887",
   226 => x"58c5efc2",
   227 => x"ff87c2c0",
   228 => x"734dc14c",
   229 => x"0599c449",
   230 => x"c387cec0",
   231 => x"dfff49f2",
   232 => x"497087de",
   233 => x"dc0299c2",
   234 => x"c1efc287",
   235 => x"c7487ebf",
   236 => x"c003a8b7",
   237 => x"486e87cb",
   238 => x"efc280c1",
   239 => x"c2c058c5",
   240 => x"c14cfe87",
   241 => x"49fdc34d",
   242 => x"87f4deff",
   243 => x"99c24970",
   244 => x"87d5c002",
   245 => x"bfc1efc2",
   246 => x"87c9c002",
   247 => x"48c1efc2",
   248 => x"c2c078c0",
   249 => x"c14cfd87",
   250 => x"49fac34d",
   251 => x"87d0deff",
   252 => x"99c24970",
   253 => x"87d9c002",
   254 => x"bfc1efc2",
   255 => x"a8b7c748",
   256 => x"87c9c003",
   257 => x"48c1efc2",
   258 => x"c2c078c7",
   259 => x"c14cfc87",
   260 => x"acb7c04d",
   261 => x"87d3c003",
   262 => x"c14866c4",
   263 => x"7e7080d8",
   264 => x"c002bf6e",
   265 => x"744b87c5",
   266 => x"c00f7349",
   267 => x"1ef0c31e",
   268 => x"f649dac1",
   269 => x"86c887d5",
   270 => x"c0029870",
   271 => x"efc287d8",
   272 => x"6e7ebfc1",
   273 => x"c491cb49",
   274 => x"82714a66",
   275 => x"c5c0026a",
   276 => x"496e4b87",
   277 => x"9d750f73",
   278 => x"87c8c002",
   279 => x"bfc1efc2",
   280 => x"87ebf149",
   281 => x"bffcd3c2",
   282 => x"87ddc002",
   283 => x"87dcc249",
   284 => x"c0029870",
   285 => x"efc287d3",
   286 => x"f149bfc1",
   287 => x"49c087d1",
   288 => x"c287f1f2",
   289 => x"c048fcd3",
   290 => x"f28ef878",
   291 => x"5e0e87cb",
   292 => x"0e5d5c5b",
   293 => x"c24c711e",
   294 => x"49bffdee",
   295 => x"4da1cdc1",
   296 => x"6981d1c1",
   297 => x"029c747e",
   298 => x"a5c487cf",
   299 => x"c27b744b",
   300 => x"49bffdee",
   301 => x"6e87eaf1",
   302 => x"059c747b",
   303 => x"4bc087c4",
   304 => x"4bc187c2",
   305 => x"ebf14973",
   306 => x"0266d487",
   307 => x"c04987c8",
   308 => x"4a7087ee",
   309 => x"4ac087c2",
   310 => x"5ac0d4c2",
   311 => x"87f9f026",
   312 => x"00000000",
   313 => x"14111258",
   314 => x"231c1b1d",
   315 => x"9491595a",
   316 => x"f4ebf2f5",
   317 => x"00000000",
   318 => x"00000000",
   319 => x"00000000",
   320 => x"ff4a711e",
   321 => x"7249bfc8",
   322 => x"4f2648a1",
   323 => x"bfc8ff1e",
   324 => x"c0c0fe89",
   325 => x"a9c0c0c0",
   326 => x"c087c401",
   327 => x"c187c24a",
   328 => x"2648724a",
   329 => x"5b5e0e4f",
   330 => x"710e5d5c",
   331 => x"4cd4ff4b",
   332 => x"c04866d0",
   333 => x"ff49d678",
   334 => x"c387fdda",
   335 => x"496c7cff",
   336 => x"7199ffc3",
   337 => x"f0c3494d",
   338 => x"a9e0c199",
   339 => x"c387cb05",
   340 => x"486c7cff",
   341 => x"66d098c3",
   342 => x"ffc37808",
   343 => x"494a6c7c",
   344 => x"ffc331c8",
   345 => x"714a6c7c",
   346 => x"c84972b2",
   347 => x"7cffc331",
   348 => x"b2714a6c",
   349 => x"31c84972",
   350 => x"6c7cffc3",
   351 => x"ffb2714a",
   352 => x"e0c048d0",
   353 => x"029b7378",
   354 => x"7b7287c2",
   355 => x"4d264875",
   356 => x"4b264c26",
   357 => x"261e4f26",
   358 => x"5b5e0e4f",
   359 => x"86f80e5c",
   360 => x"a6c81e76",
   361 => x"87fdfd49",
   362 => x"4b7086c4",
   363 => x"a8c2486e",
   364 => x"87f0c203",
   365 => x"f0c34a73",
   366 => x"aad0c19a",
   367 => x"c187c702",
   368 => x"c205aae0",
   369 => x"497387de",
   370 => x"c30299c8",
   371 => x"87c6ff87",
   372 => x"9cc34c73",
   373 => x"c105acc2",
   374 => x"66c487c2",
   375 => x"7131c949",
   376 => x"4a66c41e",
   377 => x"efc292d4",
   378 => x"817249c5",
   379 => x"87e1cffe",
   380 => x"d8ff49d8",
   381 => x"c0c887c2",
   382 => x"e2ddc21e",
   383 => x"ddebfd49",
   384 => x"48d0ff87",
   385 => x"c278e0c0",
   386 => x"cc1ee2dd",
   387 => x"92d44a66",
   388 => x"49c5efc2",
   389 => x"cdfe8172",
   390 => x"86cc87e8",
   391 => x"c105acc1",
   392 => x"66c487c2",
   393 => x"7131c949",
   394 => x"4a66c41e",
   395 => x"efc292d4",
   396 => x"817249c5",
   397 => x"87d9cefe",
   398 => x"1ee2ddc2",
   399 => x"d44a66c8",
   400 => x"c5efc292",
   401 => x"fe817249",
   402 => x"d787e8cb",
   403 => x"e7d6ff49",
   404 => x"1ec0c887",
   405 => x"49e2ddc2",
   406 => x"87dbe9fd",
   407 => x"d0ff86cc",
   408 => x"78e0c048",
   409 => x"e7fc8ef8",
   410 => x"5b5e0e87",
   411 => x"1e0e5d5c",
   412 => x"d4ff4d71",
   413 => x"7e66d44c",
   414 => x"a8b7c348",
   415 => x"c087c506",
   416 => x"87e2c148",
   417 => x"dcfe4975",
   418 => x"1e7587d4",
   419 => x"d44b66c4",
   420 => x"c5efc293",
   421 => x"fe497383",
   422 => x"c887e5c5",
   423 => x"ff4b6b83",
   424 => x"e1c848d0",
   425 => x"737cdd78",
   426 => x"99ffc349",
   427 => x"49737c71",
   428 => x"c329b7c8",
   429 => x"7c7199ff",
   430 => x"b7d04973",
   431 => x"99ffc329",
   432 => x"49737c71",
   433 => x"7129b7d8",
   434 => x"7c7cc07c",
   435 => x"7c7c7c7c",
   436 => x"7c7c7c7c",
   437 => x"e0c07c7c",
   438 => x"1e66c478",
   439 => x"d4ff49dc",
   440 => x"86c887fb",
   441 => x"fa264873",
   442 => x"731e87e4",
   443 => x"c24bc01e",
   444 => x"c048efdc",
   445 => x"ebdcc250",
   446 => x"defe49bf",
   447 => x"987087c4",
   448 => x"c287c405",
   449 => x"734bd3dc",
   450 => x"2687c448",
   451 => x"264c264d",
   452 => x"534f264b",
   453 => x"2f776f68",
   454 => x"65646968",
   455 => x"44534f20",
   456 => x"6b203d20",
   457 => x"46207965",
   458 => x"30003231",
   459 => x"00000027",
   460 => x"4f545541",
   461 => x"544f4f42",
   462 => x"0053454e",
  others => ( x"00000000")
);

-- Xilinx Vivado attributes
attribute ram_style: string;
attribute ram_style of ram: signal is "block";

signal q_local : std_logic_vector((NB_COL * COL_WIDTH)-1 downto 0);

signal wea : std_logic_vector(NB_COL - 1 downto 0);

begin

	output:
	for i in 0 to NB_COL - 1 generate
		q((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) <= q_local((i+1) * COL_WIDTH - 1 downto i * COL_WIDTH);
	end generate;
    
    -- Generate write enable signals
    -- The Block ram generator doesn't like it when the compare is done in the if statement it self.
    wea <= bytesel when we = '1' else (others => '0');

    process(clk)
    begin
        if rising_edge(clk) then
            q_local <= ram(to_integer(unsigned(addr)));
            for i in 0 to NB_COL - 1 loop
                if (wea(NB_COL-i-1) = '1') then
                    ram(to_integer(unsigned(addr)))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) <= d((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
                end if;
            end loop;
        end if;
    end process;

end arch;
