/**
 * TLS
 *
 * Contains some TLS protocol constants.
 */
package com.hurlant.crypto.tls {
    public class TLS {
        public static const VERSION_1_0:uint = 0x0301;
        public static const VERSION_1_1:uint = 0x0302;
        public static const VERSION_1_2:uint = 0x0303;
        public static const VERSION_1_3:uint = 0x0304; // Reserved value, unsupported now.

        public static const tlsDebug:Boolean = false;
        public static const MASTER_SECRET_MESSAGE_CONTENT:String = "master secret";
        public static const KEY_EXPANSION_MESSAGE_CONTENT:String = "key expansion";
        public static const CLIENT_FINISHED_MESSAGE_CONTENT:String = "client finished";
        public static const SERVER_FINISHED_MESSAGE_CONTENT:String = "server finished";
    }
}