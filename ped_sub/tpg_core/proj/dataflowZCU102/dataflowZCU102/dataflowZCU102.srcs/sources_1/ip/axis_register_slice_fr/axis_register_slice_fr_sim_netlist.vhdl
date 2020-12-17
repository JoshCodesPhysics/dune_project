-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Tue Dec 15 11:08:55 2020
-- Host        : heplnw061.pp.rl.ac.uk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /net/home/ppd/hmo31799/Documents/dune_project/ped_sub/tpg_core/proj/dataflowZCU102/dataflowZCU102/dataflowZCU102.srcs/sources_1/ip/axis_register_slice_fr/axis_register_slice_fr_sim_netlist.vhdl
-- Design      : axis_register_slice_fr
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axis_register_slice_fr_axis_register_slice_v1_1_18_axisc_register_slice is
  port (
    s_axis_tready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \storage_data1_reg[19]_0\ : out STD_LOGIC_VECTOR ( 19 downto 0 );
    aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    aclken : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \storage_data2_reg[19]_0\ : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s_axis_tvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_register_slice_fr_axis_register_slice_v1_1_18_axisc_register_slice : entity is "axis_register_slice_v1_1_18_axisc_register_slice";
end axis_register_slice_fr_axis_register_slice_v1_1_18_axisc_register_slice;

architecture STRUCTURE of axis_register_slice_fr_axis_register_slice_v1_1_18_axisc_register_slice is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal areset_d : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s_axis_tready\ : STD_LOGIC;
  signal s_ready_i0 : STD_LOGIC;
  signal s_ready_i_i_1_n_0 : STD_LOGIC;
  signal s_ready_i_i_3_n_0 : STD_LOGIC;
  signal s_ready_i_i_4_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[0]_i_2_n_0\ : STD_LOGIC;
  signal \state[0]_i_4_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  signal storage_data1 : STD_LOGIC;
  signal \storage_data1[0]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[10]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[11]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[12]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[13]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[14]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[15]_i_2_n_0\ : STD_LOGIC;
  signal \storage_data1[16]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[17]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[18]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[19]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[1]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[2]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[3]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[4]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[5]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[6]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[7]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[8]_i_1_n_0\ : STD_LOGIC;
  signal \storage_data1[9]_i_1_n_0\ : STD_LOGIC;
  signal storage_data2 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal storage_data2_0 : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \areset_d_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \areset_d_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of s_ready_i_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \state[0]_i_4\ : label is "soft_lutpair0";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \state_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \state_reg[1]\ : label is "none";
begin
  Q(0) <= \^q\(0);
  s_axis_tready <= \^s_axis_tready\;
\areset_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => aclken,
      D => D(0),
      Q => areset_d(0),
      R => '0'
    );
\areset_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => aclken,
      D => areset_d(0),
      Q => areset_d(1),
      R => '0'
    );
s_ready_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FEEE0222"
    )
        port map (
      I0 => \^s_axis_tready\,
      I1 => s_ready_i0,
      I2 => s_ready_i_i_3_n_0,
      I3 => \^q\(0),
      I4 => s_ready_i_i_4_n_0,
      I5 => D(0),
      O => s_ready_i_i_1_n_0
    );
s_ready_i_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => areset_d(0),
      I1 => areset_d(1),
      I2 => aclken,
      O => s_ready_i0
    );
s_ready_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00040000000A0000"
    )
        port map (
      I0 => m_axis_tready,
      I1 => s_axis_tvalid,
      I2 => areset_d(1),
      I3 => areset_d(0),
      I4 => aclken,
      I5 => \state_reg_n_0_[1]\,
      O => s_ready_i_i_3_n_0
    );
s_ready_i_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4444F444"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => m_axis_tready,
      I2 => aclken,
      I3 => areset_d(1),
      I4 => areset_d(0),
      O => s_ready_i_i_4_n_0
    );
s_ready_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => s_ready_i_i_1_n_0,
      Q => \^s_axis_tready\,
      R => '0'
    );
\state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => aclken,
      I1 => areset_d(1),
      I2 => areset_d(0),
      I3 => D(0),
      O => \state[0]_i_1_n_0\
    );
\state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78BB0000"
    )
        port map (
      I0 => m_axis_tready,
      I1 => \^q\(0),
      I2 => s_axis_tvalid,
      I3 => \state_reg_n_0_[1]\,
      I4 => \state[0]_i_4_n_0\,
      O => \state[0]_i_2_n_0\
    );
\state[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7088"
    )
        port map (
      I0 => m_axis_tready,
      I1 => \^q\(0),
      I2 => s_axis_tvalid,
      I3 => \state_reg_n_0_[1]\,
      O => state(0)
    );
\state[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => areset_d(1),
      I1 => areset_d(0),
      I2 => aclken,
      O => \state[0]_i_4_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BCBB"
    )
        port map (
      I0 => m_axis_tready,
      I1 => \^q\(0),
      I2 => s_axis_tvalid,
      I3 => \state_reg_n_0_[1]\,
      O => state(1)
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \state[0]_i_2_n_0\,
      D => state(0),
      Q => \^q\(0),
      R => \state[0]_i_1_n_0\
    );
\state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => \state[0]_i_2_n_0\,
      D => state(1),
      Q => \state_reg_n_0_[1]\,
      S => \state[0]_i_1_n_0\
    );
\storage_data1[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(0),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(0),
      O => \storage_data1[0]_i_1_n_0\
    );
\storage_data1[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(10),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(10),
      O => \storage_data1[10]_i_1_n_0\
    );
\storage_data1[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(11),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(11),
      O => \storage_data1[11]_i_1_n_0\
    );
\storage_data1[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(12),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(12),
      O => \storage_data1[12]_i_1_n_0\
    );
\storage_data1[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(13),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(13),
      O => \storage_data1[13]_i_1_n_0\
    );
\storage_data1[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(14),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(14),
      O => \storage_data1[14]_i_1_n_0\
    );
\storage_data1[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0008800"
    )
        port map (
      I0 => m_axis_tready,
      I1 => \^q\(0),
      I2 => s_axis_tvalid,
      I3 => aclken,
      I4 => \state_reg_n_0_[1]\,
      O => storage_data1
    );
\storage_data1[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(15),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(15),
      O => \storage_data1[15]_i_2_n_0\
    );
\storage_data1[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(16),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(16),
      O => \storage_data1[16]_i_1_n_0\
    );
\storage_data1[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(17),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(17),
      O => \storage_data1[17]_i_1_n_0\
    );
\storage_data1[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(18),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(18),
      O => \storage_data1[18]_i_1_n_0\
    );
\storage_data1[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF40"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => storage_data2(19),
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(19),
      O => \storage_data1[19]_i_1_n_0\
    );
\storage_data1[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(1),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(1),
      O => \storage_data1[1]_i_1_n_0\
    );
\storage_data1[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(2),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(2),
      O => \storage_data1[2]_i_1_n_0\
    );
\storage_data1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(3),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(3),
      O => \storage_data1[3]_i_1_n_0\
    );
\storage_data1[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(4),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(4),
      O => \storage_data1[4]_i_1_n_0\
    );
\storage_data1[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(5),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(5),
      O => \storage_data1[5]_i_1_n_0\
    );
\storage_data1[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(6),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(6),
      O => \storage_data1[6]_i_1_n_0\
    );
\storage_data1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(7),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(7),
      O => \storage_data1[7]_i_1_n_0\
    );
\storage_data1[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(8),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(8),
      O => \storage_data1[8]_i_1_n_0\
    );
\storage_data1[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF20"
    )
        port map (
      I0 => storage_data2(9),
      I1 => \state_reg_n_0_[1]\,
      I2 => \^q\(0),
      I3 => \storage_data2_reg[19]_0\(9),
      O => \storage_data1[9]_i_1_n_0\
    );
\storage_data1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[0]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(0),
      R => '0'
    );
\storage_data1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[10]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(10),
      R => '0'
    );
\storage_data1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[11]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(11),
      R => '0'
    );
\storage_data1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[12]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(12),
      R => '0'
    );
\storage_data1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[13]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(13),
      R => '0'
    );
\storage_data1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[14]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(14),
      R => '0'
    );
\storage_data1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[15]_i_2_n_0\,
      Q => \storage_data1_reg[19]_0\(15),
      R => '0'
    );
\storage_data1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[16]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(16),
      R => '0'
    );
\storage_data1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[17]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(17),
      R => '0'
    );
\storage_data1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[18]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(18),
      R => '0'
    );
\storage_data1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[19]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(19),
      R => '0'
    );
\storage_data1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[1]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(1),
      R => '0'
    );
\storage_data1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[2]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(2),
      R => '0'
    );
\storage_data1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[3]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(3),
      R => '0'
    );
\storage_data1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[4]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(4),
      R => '0'
    );
\storage_data1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[5]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(5),
      R => '0'
    );
\storage_data1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[6]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(6),
      R => '0'
    );
\storage_data1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[7]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(7),
      R => '0'
    );
\storage_data1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[8]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(8),
      R => '0'
    );
\storage_data1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data1,
      D => \storage_data1[9]_i_1_n_0\,
      Q => \storage_data1_reg[19]_0\(9),
      R => '0'
    );
\storage_data2[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => aclken,
      I2 => \^s_axis_tready\,
      O => storage_data2_0
    );
\storage_data2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(0),
      Q => storage_data2(0),
      R => '0'
    );
\storage_data2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(10),
      Q => storage_data2(10),
      R => '0'
    );
\storage_data2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(11),
      Q => storage_data2(11),
      R => '0'
    );
\storage_data2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(12),
      Q => storage_data2(12),
      R => '0'
    );
\storage_data2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(13),
      Q => storage_data2(13),
      R => '0'
    );
\storage_data2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(14),
      Q => storage_data2(14),
      R => '0'
    );
\storage_data2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(15),
      Q => storage_data2(15),
      R => '0'
    );
\storage_data2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(16),
      Q => storage_data2(16),
      R => '0'
    );
\storage_data2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(17),
      Q => storage_data2(17),
      R => '0'
    );
\storage_data2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(18),
      Q => storage_data2(18),
      R => '0'
    );
\storage_data2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(19),
      Q => storage_data2(19),
      R => '0'
    );
\storage_data2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(1),
      Q => storage_data2(1),
      R => '0'
    );
\storage_data2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(2),
      Q => storage_data2(2),
      R => '0'
    );
\storage_data2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(3),
      Q => storage_data2(3),
      R => '0'
    );
\storage_data2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(4),
      Q => storage_data2(4),
      R => '0'
    );
\storage_data2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(5),
      Q => storage_data2(5),
      R => '0'
    );
\storage_data2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(6),
      Q => storage_data2(6),
      R => '0'
    );
\storage_data2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(7),
      Q => storage_data2(7),
      R => '0'
    );
\storage_data2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(8),
      Q => storage_data2(8),
      R => '0'
    );
\storage_data2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => storage_data2_0,
      D => \storage_data2_reg[19]_0\(9),
      Q => storage_data2(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice is
  port (
    aclk : in STD_LOGIC;
    aclk2x : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is "32'b00000000000000000000000010011011";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 16;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is "zynquplus";
  attribute C_NUM_SLR_CROSSINGS : integer;
  attribute C_NUM_SLR_CROSSINGS of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 0;
  attribute C_PIPELINES_MASTER : integer;
  attribute C_PIPELINES_MASTER of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 0;
  attribute C_PIPELINES_MIDDLE : integer;
  attribute C_PIPELINES_MIDDLE of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 0;
  attribute C_PIPELINES_SLAVE : integer;
  attribute C_PIPELINES_SLAVE of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 0;
  attribute C_REG_CONFIG : integer;
  attribute C_REG_CONFIG of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 8;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is "yes";
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is "axis_register_slice_v1_1_18_axis_register_slice";
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice : entity is 20;
end axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice;

architecture STRUCTURE of axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice is
  signal \<const0>\ : STD_LOGIC;
  signal areset_r : STD_LOGIC;
  signal areset_r_i_1_n_0 : STD_LOGIC;
begin
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
areset_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => areset_r_i_1_n_0
    );
areset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => areset_r_i_1_n_0,
      Q => areset_r,
      R => '0'
    );
axisc_register_slice_0: entity work.axis_register_slice_fr_axis_register_slice_v1_1_18_axisc_register_slice
     port map (
      D(0) => areset_r,
      Q(0) => m_axis_tvalid,
      aclk => aclk,
      aclken => aclken,
      m_axis_tready => m_axis_tready,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid,
      \storage_data1_reg[19]_0\(19) => m_axis_tuser(0),
      \storage_data1_reg[19]_0\(18) => m_axis_tlast,
      \storage_data1_reg[19]_0\(17 downto 16) => m_axis_tkeep(1 downto 0),
      \storage_data1_reg[19]_0\(15 downto 0) => m_axis_tdata(15 downto 0),
      \storage_data2_reg[19]_0\(19) => s_axis_tuser(0),
      \storage_data2_reg[19]_0\(18) => s_axis_tlast,
      \storage_data2_reg[19]_0\(17 downto 16) => s_axis_tkeep(1 downto 0),
      \storage_data2_reg[19]_0\(15 downto 0) => s_axis_tdata(15 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axis_register_slice_fr is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axis_register_slice_fr : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axis_register_slice_fr : entity is "axis_register_slice_fr,axis_register_slice_v1_1_18_axis_register_slice,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_register_slice_fr : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axis_register_slice_fr : entity is "axis_register_slice_v1_1_18_axis_register_slice,Vivado 2018.3";
end axis_register_slice_fr;

architecture STRUCTURE of axis_register_slice_fr is
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000010011011";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 16;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynquplus";
  attribute C_NUM_SLR_CROSSINGS : integer;
  attribute C_NUM_SLR_CROSSINGS of inst : label is 0;
  attribute C_PIPELINES_MASTER : integer;
  attribute C_PIPELINES_MASTER of inst : label is 0;
  attribute C_PIPELINES_MIDDLE : integer;
  attribute C_PIPELINES_MIDDLE of inst : label is 0;
  attribute C_PIPELINES_SLAVE : integer;
  attribute C_PIPELINES_SLAVE of inst : label is 0;
  attribute C_REG_CONFIG : integer;
  attribute C_REG_CONFIG of inst : label is 8;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of inst : label is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of inst : label is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of inst : label is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of inst : label is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of inst : label is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of inst : label is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of inst : label is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of inst : label is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of inst : label is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of inst : label is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of inst : label is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of inst : label is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of inst : label is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of inst : label is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of inst : label is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of inst : label is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of inst : label is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of inst : label is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of inst : label is 1;
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of inst : label is 20;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLKIF CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLKIF, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RSTIF RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of m_axis_tkeep : signal is "xilinx.com:interface:axis:1.0 M_AXIS TKEEP";
  attribute X_INTERFACE_INFO of m_axis_tuser : signal is "xilinx.com:interface:axis:1.0 M_AXIS TUSER";
  attribute X_INTERFACE_PARAMETER of m_axis_tuser : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute X_INTERFACE_INFO of s_axis_tkeep : signal is "xilinx.com:interface:axis:1.0 S_AXIS TKEEP";
  attribute X_INTERFACE_INFO of s_axis_tuser : signal is "xilinx.com:interface:axis:1.0 S_AXIS TUSER";
  attribute X_INTERFACE_PARAMETER of s_axis_tuser : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0";
begin
inst: entity work.axis_register_slice_fr_axis_register_slice_v1_1_18_axis_register_slice
     port map (
      aclk => aclk,
      aclk2x => '0',
      aclken => '1',
      aresetn => aresetn,
      m_axis_tdata(15 downto 0) => m_axis_tdata(15 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(1 downto 0) => m_axis_tkeep(1 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(1 downto 0) => NLW_inst_m_axis_tstrb_UNCONNECTED(1 downto 0),
      m_axis_tuser(0) => m_axis_tuser(0),
      m_axis_tvalid => m_axis_tvalid,
      s_axis_tdata(15 downto 0) => s_axis_tdata(15 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(1 downto 0) => s_axis_tkeep(1 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(1 downto 0) => B"11",
      s_axis_tuser(0) => s_axis_tuser(0),
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
