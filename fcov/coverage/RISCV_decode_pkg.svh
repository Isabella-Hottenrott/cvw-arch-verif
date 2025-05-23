///////////////////////////////////////////
//
// RISC-V Architectural Functional Coverage Instruction Disassembler Helper Functions
//
// Copyright (C) 2025 Harvey Mudd College, 10x Engineers, UET Lahore, Habib University
// Written: Kaden Cassidy jacassidy@hmc.edu March 2025
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file
// except in compliance with the License, or, at your option, the Apache License version 2.0. You
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

package RISCV_decode_pkg;

    `include "coverage/RISCV_imported_decode_pkg.svh"

    localparam [31:0] VLE8_V                 = 32'b000000?00000?????000?????0000111;
    localparam [31:0] VLE16_V                = 32'b000000?00000?????101?????0000111;
    localparam [31:0] VLE32_V                = 32'b000000?00000?????110?????0000111;
    localparam [31:0] VLE64_V                = 32'b000000?00000?????111?????0000111;
    localparam [31:0] VLSEG2E8_V             = 32'b001000?00000?????000?????0000111;
    localparam [31:0] VLSEG2E16_V            = 32'b001000?00000?????101?????0000111;
    localparam [31:0] VLSEG2E32_V            = 32'b001000?00000?????110?????0000111;
    localparam [31:0] VLSEG2E64_V            = 32'b001000?00000?????111?????0000111;
    localparam [31:0] VLSEG3E8_V             = 32'b010000?00000?????000?????0000111;
    localparam [31:0] VLSEG3E16_V            = 32'b010000?00000?????101?????0000111;
    localparam [31:0] VLSEG3E32_V            = 32'b010000?00000?????110?????0000111;
    localparam [31:0] VLSEG3E64_V            = 32'b010000?00000?????111?????0000111;
    localparam [31:0] VLSEG4E8_V             = 32'b011000?00000?????000?????0000111;
    localparam [31:0] VLSEG4E16_V            = 32'b011000?00000?????101?????0000111;
    localparam [31:0] VLSEG4E32_V            = 32'b011000?00000?????110?????0000111;
    localparam [31:0] VLSEG4E64_V            = 32'b011000?00000?????111?????0000111;
    localparam [31:0] VLSEG5E8_V             = 32'b100000?00000?????000?????0000111;
    localparam [31:0] VLSEG5E16_V            = 32'b100000?00000?????101?????0000111;
    localparam [31:0] VLSEG5E32_V            = 32'b100000?00000?????110?????0000111;
    localparam [31:0] VLSEG5E64_V            = 32'b100000?00000?????111?????0000111;
    localparam [31:0] VLSEG6E8_V             = 32'b101000?00000?????000?????0000111;
    localparam [31:0] VLSEG6E16_V            = 32'b101000?00000?????101?????0000111;
    localparam [31:0] VLSEG6E32_V            = 32'b101000?00000?????110?????0000111;
    localparam [31:0] VLSEG6E64_V            = 32'b101000?00000?????111?????0000111;
    localparam [31:0] VLSEG7E8_V             = 32'b110000?00000?????000?????0000111;
    localparam [31:0] VLSEG7E16_V            = 32'b110000?00000?????101?????0000111;
    localparam [31:0] VLSEG7E32_V            = 32'b110000?00000?????110?????0000111;
    localparam [31:0] VLSEG7E64_V            = 32'b110000?00000?????111?????0000111;
    localparam [31:0] VLSEG8E8_V             = 32'b111000?00000?????000?????0000111;
    localparam [31:0] VLSEG8E16_V            = 32'b111000?00000?????101?????0000111;
    localparam [31:0] VLSEG8E32_V            = 32'b111000?00000?????110?????0000111;
    localparam [31:0] VLSEG8E64_V            = 32'b111000?00000?????111?????0000111;

    localparam [31:0] VLE8FF_V               = 32'b000000?10000?????000?????0000111;
    localparam [31:0] VLE16FF_V              = 32'b000000?10000?????101?????0000111;
    localparam [31:0] VLE32FF_V              = 32'b000000?10000?????110?????0000111;
    localparam [31:0] VLE64FF_V              = 32'b000000?10000?????111?????0000111;
    localparam [31:0] VLSEG2E8FF_V           = 32'b001000?10000?????000?????0000111;
    localparam [31:0] VLSEG2E16FF_V          = 32'b001000?10000?????101?????0000111;
    localparam [31:0] VLSEG2E32FF_V          = 32'b001000?10000?????110?????0000111;
    localparam [31:0] VLSEG2E64FF_V          = 32'b001000?10000?????111?????0000111;
    localparam [31:0] VLSEG3E8FF_V           = 32'b010000?10000?????000?????0000111;
    localparam [31:0] VLSEG3E16FF_V          = 32'b010000?10000?????101?????0000111;
    localparam [31:0] VLSEG3E32FF_V          = 32'b010000?10000?????110?????0000111;
    localparam [31:0] VLSEG3E64FF_V          = 32'b010000?10000?????111?????0000111;
    localparam [31:0] VLSEG4E8FF_V           = 32'b011000?10000?????000?????0000111;
    localparam [31:0] VLSEG4E16FF_V          = 32'b011000?10000?????101?????0000111;
    localparam [31:0] VLSEG4E32FF_V          = 32'b011000?10000?????110?????0000111;
    localparam [31:0] VLSEG4E64FF_V          = 32'b011000?10000?????111?????0000111;
    localparam [31:0] VLSEG5E8FF_V           = 32'b100000?10000?????000?????0000111;
    localparam [31:0] VLSEG5E16FF_V          = 32'b100000?10000?????101?????0000111;
    localparam [31:0] VLSEG5E32FF_V          = 32'b100000?10000?????110?????0000111;
    localparam [31:0] VLSEG5E64FF_V          = 32'b100000?10000?????111?????0000111;
    localparam [31:0] VLSEG6E8FF_V           = 32'b101000?10000?????000?????0000111;
    localparam [31:0] VLSEG6E16FF_V          = 32'b101000?10000?????101?????0000111;
    localparam [31:0] VLSEG6E32FF_V          = 32'b101000?10000?????110?????0000111;
    localparam [31:0] VLSEG6E64FF_V          = 32'b101000?10000?????111?????0000111;
    localparam [31:0] VLSEG7E8FF_V           = 32'b110000?10000?????000?????0000111;
    localparam [31:0] VLSEG7E16FF_V          = 32'b110000?10000?????101?????0000111;
    localparam [31:0] VLSEG7E32FF_V          = 32'b110000?10000?????110?????0000111;
    localparam [31:0] VLSEG7E64FF_V          = 32'b110000?10000?????111?????0000111;
    localparam [31:0] VLSEG8E8FF_V           = 32'b111000?10000?????000?????0000111;
    localparam [31:0] VLSEG8E16FF_V          = 32'b111000?10000?????101?????0000111;
    localparam [31:0] VLSEG8E32FF_V          = 32'b111000?10000?????110?????0000111;
    localparam [31:0] VLSEG8E64FF_V          = 32'b111000?10000?????111?????0000111;

    localparam [31:0] VLSE8_V                = 32'b000010???????????000?????0000111;
    localparam [31:0] VLSE16_V               = 32'b000010???????????101?????0000111;
    localparam [31:0] VLSE32_V               = 32'b000010???????????110?????0000111;
    localparam [31:0] VLSE64_V               = 32'b000010???????????111?????0000111;
    localparam [31:0] VLSSEG2E8_V            = 32'b001010???????????000?????0000111;
    localparam [31:0] VLSSEG2E16_V           = 32'b001010???????????101?????0000111;
    localparam [31:0] VLSSEG2E32_V           = 32'b001010???????????110?????0000111;
    localparam [31:0] VLSSEG2E64_V           = 32'b001010???????????111?????0000111;
    localparam [31:0] VLSSEG3E8_V            = 32'b010010???????????000?????0000111;
    localparam [31:0] VLSSEG3E16_V           = 32'b010010???????????101?????0000111;
    localparam [31:0] VLSSEG3E32_V           = 32'b010010???????????110?????0000111;
    localparam [31:0] VLSSEG3E64_V           = 32'b010010???????????111?????0000111;
    localparam [31:0] VLSSEG4E8_V            = 32'b011010???????????000?????0000111;
    localparam [31:0] VLSSEG4E16_V           = 32'b011010???????????101?????0000111;
    localparam [31:0] VLSSEG4E32_V           = 32'b011010???????????110?????0000111;
    localparam [31:0] VLSSEG4E64_V           = 32'b011010???????????111?????0000111;
    localparam [31:0] VLSSEG5E8_V            = 32'b100010???????????000?????0000111;
    localparam [31:0] VLSSEG5E16_V           = 32'b100010???????????101?????0000111;
    localparam [31:0] VLSSEG5E32_V           = 32'b100010???????????110?????0000111;
    localparam [31:0] VLSSEG5E64_V           = 32'b100010???????????111?????0000111;
    localparam [31:0] VLSSEG6E8_V            = 32'b101010???????????000?????0000111;
    localparam [31:0] VLSSEG6E16_V           = 32'b101010???????????101?????0000111;
    localparam [31:0] VLSSEG6E32_V           = 32'b101010???????????110?????0000111;
    localparam [31:0] VLSSEG6E64_V           = 32'b101010???????????111?????0000111;
    localparam [31:0] VLSSEG7E8_V            = 32'b110010???????????000?????0000111;
    localparam [31:0] VLSSEG7E16_V           = 32'b110010???????????101?????0000111;
    localparam [31:0] VLSSEG7E32_V           = 32'b110010???????????110?????0000111;
    localparam [31:0] VLSSEG7E64_V           = 32'b110010???????????111?????0000111;
    localparam [31:0] VLSSEG8E8_V            = 32'b111010???????????000?????0000111;
    localparam [31:0] VLSSEG8E16_V           = 32'b111010???????????101?????0000111;
    localparam [31:0] VLSSEG8E32_V           = 32'b111010???????????110?????0000111;
    localparam [31:0] VLSSEG8E64_V           = 32'b111010???????????111?????0000111;

    localparam [31:0] VLUXEI8_V              = 32'b000001???????????000?????0000111;
    localparam [31:0] VLUXEI16_V             = 32'b000001???????????101?????0000111;
    localparam [31:0] VLUXEI32_V             = 32'b000001???????????110?????0000111;
    localparam [31:0] VLUXEI64_V             = 32'b000001???????????111?????0000111;
    localparam [31:0] VLUXSEG2EI8_V          = 32'b001001???????????000?????0000111;
    localparam [31:0] VLUXSEG2EI16_V         = 32'b001001???????????101?????0000111;
    localparam [31:0] VLUXSEG2EI32_V         = 32'b001001???????????110?????0000111;
    localparam [31:0] VLUXSEG2EI64_V         = 32'b001001???????????111?????0000111;
    localparam [31:0] VLUXSEG3EI8_V          = 32'b010001???????????000?????0000111;
    localparam [31:0] VLUXSEG3EI16_V         = 32'b010001???????????101?????0000111;
    localparam [31:0] VLUXSEG3EI32_V         = 32'b010001???????????110?????0000111;
    localparam [31:0] VLUXSEG3EI64_V         = 32'b010001???????????111?????0000111;
    localparam [31:0] VLUXSEG4EI8_V          = 32'b011001???????????000?????0000111;
    localparam [31:0] VLUXSEG4EI16_V         = 32'b011001???????????101?????0000111;
    localparam [31:0] VLUXSEG4EI32_V         = 32'b011001???????????110?????0000111;
    localparam [31:0] VLUXSEG4EI64_V         = 32'b011001???????????111?????0000111;
    localparam [31:0] VLUXSEG5EI8_V          = 32'b100001???????????000?????0000111;
    localparam [31:0] VLUXSEG5EI16_V         = 32'b100001???????????101?????0000111;
    localparam [31:0] VLUXSEG5EI32_V         = 32'b100001???????????110?????0000111;
    localparam [31:0] VLUXSEG5EI64_V         = 32'b100001???????????111?????0000111;
    localparam [31:0] VLUXSEG6EI8_V          = 32'b101001???????????000?????0000111;
    localparam [31:0] VLUXSEG6EI16_V         = 32'b101001???????????101?????0000111;
    localparam [31:0] VLUXSEG6EI32_V         = 32'b101001???????????110?????0000111;
    localparam [31:0] VLUXSEG6EI64_V         = 32'b101001???????????111?????0000111;
    localparam [31:0] VLUXSEG7EI8_V          = 32'b110001???????????000?????0000111;
    localparam [31:0] VLUXSEG7EI16_V         = 32'b110001???????????101?????0000111;
    localparam [31:0] VLUXSEG7EI32_V         = 32'b110001???????????110?????0000111;
    localparam [31:0] VLUXSEG7EI64_V         = 32'b110001???????????111?????0000111;
    localparam [31:0] VLUXSEG8EI8_V          = 32'b111001???????????000?????0000111;
    localparam [31:0] VLUXSEG8EI16_V         = 32'b111001???????????101?????0000111;
    localparam [31:0] VLUXSEG8EI32_V         = 32'b111001???????????110?????0000111;
    localparam [31:0] VLUXSEG8EI64_V         = 32'b111001???????????111?????0000111;

    localparam [31:0] VLOXEI8_V              = 32'b000011???????????000?????0000111;
    localparam [31:0] VLOXEI16_V             = 32'b000011???????????101?????0000111;
    localparam [31:0] VLOXEI32_V             = 32'b000011???????????110?????0000111;
    localparam [31:0] VLOXEI64_V             = 32'b000011???????????111?????0000111;
    localparam [31:0] VLOXSEG2EI8_V          = 32'b001011???????????000?????0000111;
    localparam [31:0] VLOXSEG2EI16_V         = 32'b001011???????????101?????0000111;
    localparam [31:0] VLOXSEG2EI32_V         = 32'b001011???????????110?????0000111;
    localparam [31:0] VLOXSEG2EI64_V         = 32'b001011???????????111?????0000111;
    localparam [31:0] VLOXSEG3EI8_V          = 32'b010011???????????000?????0000111;
    localparam [31:0] VLOXSEG3EI16_V         = 32'b010011???????????101?????0000111;
    localparam [31:0] VLOXSEG3EI32_V         = 32'b010011???????????110?????0000111;
    localparam [31:0] VLOXSEG3EI64_V         = 32'b010011???????????111?????0000111;
    localparam [31:0] VLOXSEG4EI8_V          = 32'b011011???????????000?????0000111;
    localparam [31:0] VLOXSEG4EI16_V         = 32'b011011???????????101?????0000111;
    localparam [31:0] VLOXSEG4EI32_V         = 32'b011011???????????110?????0000111;
    localparam [31:0] VLOXSEG4EI64_V         = 32'b011011???????????111?????0000111;
    localparam [31:0] VLOXSEG5EI8_V          = 32'b100011???????????000?????0000111;
    localparam [31:0] VLOXSEG5EI16_V         = 32'b100011???????????101?????0000111;
    localparam [31:0] VLOXSEG5EI32_V         = 32'b100011???????????110?????0000111;
    localparam [31:0] VLOXSEG5EI64_V         = 32'b100011???????????111?????0000111;
    localparam [31:0] VLOXSEG6EI8_V          = 32'b101011???????????000?????0000111;
    localparam [31:0] VLOXSEG6EI16_V         = 32'b101011???????????101?????0000111;
    localparam [31:0] VLOXSEG6EI32_V         = 32'b101011???????????110?????0000111;
    localparam [31:0] VLOXSEG6EI64_V         = 32'b101011???????????111?????0000111;
    localparam [31:0] VLOXSEG7EI8_V          = 32'b110011???????????000?????0000111;
    localparam [31:0] VLOXSEG7EI16_V         = 32'b110011???????????101?????0000111;
    localparam [31:0] VLOXSEG7EI32_V         = 32'b110011???????????110?????0000111;
    localparam [31:0] VLOXSEG7EI64_V         = 32'b110011???????????111?????0000111;
    localparam [31:0] VLOXSEG8EI8_V          = 32'b111011???????????000?????0000111;
    localparam [31:0] VLOXSEG8EI16_V         = 32'b111011???????????101?????0000111;
    localparam [31:0] VLOXSEG8EI32_V         = 32'b111011???????????110?????0000111;
    localparam [31:0] VLOXSEG8EI64_V         = 32'b111011???????????111?????0000111;

    localparam [31:0] VSSEG2E8_V             = 32'b001000?00000?????000?????0100111;
    localparam [31:0] VSSEG2E16_V            = 32'b001000?00000?????101?????0100111;
    localparam [31:0] VSSEG2E32_V            = 32'b001000?00000?????110?????0100111;
    localparam [31:0] VSSEG2E64_V            = 32'b001000?00000?????111?????0100111;
    localparam [31:0] VSSEG3E8_V             = 32'b010000?00000?????000?????0100111;
    localparam [31:0] VSSEG3E16_V            = 32'b010000?00000?????101?????0100111;
    localparam [31:0] VSSEG3E32_V            = 32'b010000?00000?????110?????0100111;
    localparam [31:0] VSSEG3E64_V            = 32'b010000?00000?????111?????0100111;
    localparam [31:0] VSSEG4E8_V             = 32'b011000?00000?????000?????0100111;
    localparam [31:0] VSSEG4E16_V            = 32'b011000?00000?????101?????0100111;
    localparam [31:0] VSSEG4E32_V            = 32'b011000?00000?????110?????0100111;
    localparam [31:0] VSSEG4E64_V            = 32'b011000?00000?????111?????0100111;
    localparam [31:0] VSSEG5E8_V             = 32'b100000?00000?????000?????0100111;
    localparam [31:0] VSSEG5E16_V            = 32'b100000?00000?????101?????0100111;
    localparam [31:0] VSSEG5E32_V            = 32'b100000?00000?????110?????0100111;
    localparam [31:0] VSSEG5E64_V            = 32'b100000?00000?????111?????0100111;
    localparam [31:0] VSSEG6E8_V             = 32'b101000?00000?????000?????0100111;
    localparam [31:0] VSSEG6E16_V            = 32'b101000?00000?????101?????0100111;
    localparam [31:0] VSSEG6E32_V            = 32'b101000?00000?????110?????0100111;
    localparam [31:0] VSSEG6E64_V            = 32'b101000?00000?????111?????0100111;
    localparam [31:0] VSSEG7E8_V             = 32'b110000?00000?????000?????0100111;
    localparam [31:0] VSSEG7E16_V            = 32'b110000?00000?????101?????0100111;
    localparam [31:0] VSSEG7E32_V            = 32'b110000?00000?????110?????0100111;
    localparam [31:0] VSSEG7E64_V            = 32'b110000?00000?????111?????0100111;
    localparam [31:0] VSSEG8E8_V             = 32'b111000?00000?????000?????0100111;
    localparam [31:0] VSSEG8E16_V            = 32'b111000?00000?????101?????0100111;
    localparam [31:0] VSSEG8E32_V            = 32'b111000?00000?????110?????0100111;
    localparam [31:0] VSSEG8E64_V            = 32'b111000?00000?????111?????0100111;

    localparam [31:0] VSSSEG2E8_V            = 32'b001010???????????000?????0100111;
    localparam [31:0] VSSSEG2E16_V           = 32'b001010???????????101?????0100111;
    localparam [31:0] VSSSEG2E32_V           = 32'b001010???????????110?????0100111;
    localparam [31:0] VSSSEG2E64_V           = 32'b001010???????????111?????0100111;
    localparam [31:0] VSSSEG3E8_V            = 32'b010010???????????000?????0100111;
    localparam [31:0] VSSSEG3E16_V           = 32'b010010???????????101?????0100111;
    localparam [31:0] VSSSEG3E32_V           = 32'b010010???????????110?????0100111;
    localparam [31:0] VSSSEG3E64_V           = 32'b010010???????????111?????0100111;
    localparam [31:0] VSSSEG4E8_V            = 32'b011010???????????000?????0100111;
    localparam [31:0] VSSSEG4E16_V           = 32'b011010???????????101?????0100111;
    localparam [31:0] VSSSEG4E32_V           = 32'b011010???????????110?????0100111;
    localparam [31:0] VSSSEG4E64_V           = 32'b011010???????????111?????0100111;
    localparam [31:0] VSSSEG5E8_V            = 32'b100010???????????000?????0100111;
    localparam [31:0] VSSSEG5E16_V           = 32'b100010???????????101?????0100111;
    localparam [31:0] VSSSEG5E32_V           = 32'b100010???????????110?????0100111;
    localparam [31:0] VSSSEG5E64_V           = 32'b100010???????????111?????0100111;
    localparam [31:0] VSSSEG6E8_V            = 32'b101010???????????000?????0100111;
    localparam [31:0] VSSSEG6E16_V           = 32'b101010???????????101?????0100111;
    localparam [31:0] VSSSEG6E32_V           = 32'b101010???????????110?????0100111;
    localparam [31:0] VSSSEG6E64_V           = 32'b101010???????????111?????0100111;
    localparam [31:0] VSSSEG7E8_V            = 32'b110010???????????000?????0100111;
    localparam [31:0] VSSSEG7E16_V           = 32'b110010???????????101?????0100111;
    localparam [31:0] VSSSEG7E32_V           = 32'b110010???????????110?????0100111;
    localparam [31:0] VSSSEG7E64_V           = 32'b110010???????????111?????0100111;
    localparam [31:0] VSSSEG8E8_V            = 32'b111010???????????000?????0100111;
    localparam [31:0] VSSSEG8E16_V           = 32'b111010???????????101?????0100111;
    localparam [31:0] VSSSEG8E32_V           = 32'b111010???????????110?????0100111;
    localparam [31:0] VSSSEG8E64_V           = 32'b111010???????????111?????0100111;

    localparam [31:0] VSUXSEG2EI8_V          = 32'b001001???????????000?????0100111;
    localparam [31:0] VSUXSEG2EI16_V         = 32'b001001???????????101?????0100111;
    localparam [31:0] VSUXSEG2EI32_V         = 32'b001001???????????110?????0100111;
    localparam [31:0] VSUXSEG2EI64_V         = 32'b001001???????????111?????0100111;
    localparam [31:0] VSUXSEG3EI8_V          = 32'b010001???????????000?????0100111;
    localparam [31:0] VSUXSEG3EI16_V         = 32'b010001???????????101?????0100111;
    localparam [31:0] VSUXSEG3EI32_V         = 32'b010001???????????110?????0100111;
    localparam [31:0] VSUXSEG3EI64_V         = 32'b010001???????????111?????0100111;
    localparam [31:0] VSUXSEG4EI8_V          = 32'b011001???????????000?????0100111;
    localparam [31:0] VSUXSEG4EI16_V         = 32'b011001???????????101?????0100111;
    localparam [31:0] VSUXSEG4EI32_V         = 32'b011001???????????110?????0100111;
    localparam [31:0] VSUXSEG4EI64_V         = 32'b011001???????????111?????0100111;
    localparam [31:0] VSUXSEG5EI8_V          = 32'b100001???????????000?????0100111;
    localparam [31:0] VSUXSEG5EI16_V         = 32'b100001???????????101?????0100111;
    localparam [31:0] VSUXSEG5EI32_V         = 32'b100001???????????110?????0100111;
    localparam [31:0] VSUXSEG5EI64_V         = 32'b100001???????????111?????0100111;
    localparam [31:0] VSUXSEG6EI8_V          = 32'b101001???????????000?????0100111;
    localparam [31:0] VSUXSEG6EI16_V         = 32'b101001???????????101?????0100111;
    localparam [31:0] VSUXSEG6EI32_V         = 32'b101001???????????110?????0100111;
    localparam [31:0] VSUXSEG6EI64_V         = 32'b101001???????????111?????0100111;
    localparam [31:0] VSUXSEG7EI8_V          = 32'b110001???????????000?????0100111;
    localparam [31:0] VSUXSEG7EI16_V         = 32'b110001???????????101?????0100111;
    localparam [31:0] VSUXSEG7EI32_V         = 32'b110001???????????110?????0100111;
    localparam [31:0] VSUXSEG7EI64_V         = 32'b110001???????????111?????0100111;
    localparam [31:0] VSUXSEG8EI8_V          = 32'b111001???????????000?????0100111;
    localparam [31:0] VSUXSEG8EI16_V         = 32'b111001???????????101?????0100111;
    localparam [31:0] VSUXSEG8EI32_V         = 32'b111001???????????110?????0100111;
    localparam [31:0] VSUXSEG8EI64_V         = 32'b111001???????????111?????0100111;

    localparam [31:0] VSOXSEG2EI8_V          = 32'b001011???????????000?????0100111;
    localparam [31:0] VSOXSEG2EI16_V         = 32'b001011???????????101?????0100111;
    localparam [31:0] VSOXSEG2EI32_V         = 32'b001011???????????110?????0100111;
    localparam [31:0] VSOXSEG2EI64_V         = 32'b001011???????????111?????0100111;
    localparam [31:0] VSOXSEG3EI8_V          = 32'b010011???????????000?????0100111;
    localparam [31:0] VSOXSEG3EI16_V         = 32'b010011???????????101?????0100111;
    localparam [31:0] VSOXSEG3EI32_V         = 32'b010011???????????110?????0100111;
    localparam [31:0] VSOXSEG3EI64_V         = 32'b010011???????????111?????0100111;
    localparam [31:0] VSOXSEG4EI8_V          = 32'b011011???????????000?????0100111;
    localparam [31:0] VSOXSEG4EI16_V         = 32'b011011???????????101?????0100111;
    localparam [31:0] VSOXSEG4EI32_V         = 32'b011011???????????110?????0100111;
    localparam [31:0] VSOXSEG4EI64_V         = 32'b011011???????????111?????0100111;
    localparam [31:0] VSOXSEG5EI8_V          = 32'b100011???????????000?????0100111;
    localparam [31:0] VSOXSEG5EI16_V         = 32'b100011???????????101?????0100111;
    localparam [31:0] VSOXSEG5EI32_V         = 32'b100011???????????110?????0100111;
    localparam [31:0] VSOXSEG5EI64_V         = 32'b100011???????????111?????0100111;
    localparam [31:0] VSOXSEG6EI8_V          = 32'b101011???????????000?????0100111;
    localparam [31:0] VSOXSEG6EI16_V         = 32'b101011???????????101?????0100111;
    localparam [31:0] VSOXSEG6EI32_V         = 32'b101011???????????110?????0100111;
    localparam [31:0] VSOXSEG6EI64_V         = 32'b101011???????????111?????0100111;
    localparam [31:0] VSOXSEG7EI8_V          = 32'b110011???????????000?????0100111;
    localparam [31:0] VSOXSEG7EI16_V         = 32'b110011???????????101?????0100111;
    localparam [31:0] VSOXSEG7EI32_V         = 32'b110011???????????110?????0100111;
    localparam [31:0] VSOXSEG7EI64_V         = 32'b110011???????????111?????0100111;
    localparam [31:0] VSOXSEG8EI8_V          = 32'b111011???????????000?????0100111;
    localparam [31:0] VSOXSEG8EI16_V         = 32'b111011???????????101?????0100111;
    localparam [31:0] VSOXSEG8EI32_V         = 32'b111011???????????110?????0100111;
    localparam [31:0] VSOXSEG8EI64_V         = 32'b111011???????????111?????0100111;

endpackage
