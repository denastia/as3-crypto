/**
 * UInt64
 *
 * An ActionScript 3 implementation of UInt64 (light version)
 *
 * See LICENSE.txt for full license information.
 */

package com.hurlant.math {
    public class UInt64 {
        public var high:uint;
        public var low:uint;

        public function UInt64(h:uint = 0, l:uint = 0) {
            high = h;
            low = l;
        }

        public function setUInt64(value:UInt64):void {
            this.high = value.high;
            this.low = value.low;
        }

        public function setUint(high:uint, low:uint):void {
            this.high = high;
            this.low = low;
        }

        /*
         * Bitwise rotate a 64-bit number to the right. High DWORD.
         */
        public function rorHigh(cnt:uint):uint {
            var cnt32:uint = cnt & 0x1F; // % 32
            var left32:uint = 32 - cnt32;
            var isOver32Bits:Boolean = (cnt & 0x20) != 0; // cnt > 32

            var l:uint;
            var r:uint;
            if (isOver32Bits) {
                r = low >>> cnt32;
                l = cnt32 != 0 ? (high << left32) : 0; // cnt32 == 0 the same check as left32 == 32
            } else {
                r = high >>> cnt32;
                l = cnt32 != 0 ? (low << left32) : 0;
            }

            return r | l;
//            return isOver32Bits
//                    ? (low >>> cnt32) | (high << left32)
//                    : (high >>> cnt32) | (low << left32);
        }

        /*
         * Bitwise rotate a 64-bit number to the right. Low DWORD.
         */
        public function rorLow(cnt:uint):uint {
            var cnt32:uint = cnt & 0x1F; // % 32
            var left32:uint = 32 - cnt32;
            var isOver32Bits:Boolean = (cnt & 0x20) != 0; // cnt > 32

            var l:uint;
            var r:uint;
            if (isOver32Bits) {
                r = high >>> cnt32;
                l = cnt32 != 0 ? (low << left32) : 0; // cnt32 == 0 the same check as left32 == 32
            } else {
                r = low >>> cnt32;
                l = cnt32 != 0 ? (high << left32) : 0;
            }

            return r | l;

//            return isOver32Bits
//                    ? (high >>> cnt32) | (low << left32)
//                    : (low >>> cnt32) | (high << left32);
        }

        public function shrHigh(cnt:uint):uint {
            var cnt32:uint = cnt & 0x1F; // % 32
            var isOver32Bits:Boolean = (cnt & 0x20) != 0; // cnt > 32

            return isOver32Bits
                    ? 0
                    : high >>> cnt32;
        }

        public function shrLow(cnt:uint):uint {
            var cnt32:uint = cnt & 0x1F; // % 32
            var left32:uint = 32 - cnt32;
            var isOver32Bits:Boolean = (cnt & 0x20) != 0; // cnt > 32

            return isOver32Bits
                    ? high >>> cnt32
                    : (low >>> cnt32) | (cnt32 != 0 ? (high << left32) : 0);
        }

        public function shlHigh(cnt:uint):uint {
            var cnt32:uint = cnt & 0x1F; // % 32
            var left32:uint = 32 - cnt32;
            var isOver32Bits:Boolean = (cnt & 0x20) != 0; // cnt > 32
//
            return isOver32Bits
                    ? low << cnt32
                    : (high << cnt32) | (cnt32 != 0 ? low >>> left32 : 0);
//                    : (low >>> cnt32) | (cnt32 != 0 ? (high << left32) : 0);
        }

        public function shlLow(cnt:uint):uint {
            var cnt32:uint = cnt & 0x1F; // % 32
            var isOver32Bits:Boolean = (cnt & 0x20) != 0; // cnt > 32

            return isOver32Bits
                    ? 0
                    : low << cnt32;
        }

        public function add(addHigh:uint, addLow:uint):void {
            var result:Number = low + addLow; // Number - 64 bit floating-point number, IEEE-754. Up to 53 bits to represent integer values.
            if (result > uint.MAX_VALUE) {
//                trace("Overflow  ->  ", high.toString(16), ",", low.toString(16), "add", addHigh.toString(16), ",", addLow.toString(16));
                high++; // count overflow
            }
            high += addHigh;
            low += addLow;
        }
    }

}