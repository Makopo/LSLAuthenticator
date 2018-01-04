//*********************************************************************
// LSL Authenticator - Simple Sample
//
// (C) Copyright 2018 Mako Nozaki.
// Mako Nozaki is the author's username in the Second Life online virtual world.
//
// This script officialy resides on GitHub.
// (https://github.com/makopo/LSLAuthenticator)
// 
// If you want practical sample,
// consider using Key Card System "NoMoreOreOre".
// https://marketplace.secondlife.com/p/Key-Card-System-NoMoreOreOre/446266
// ********************************************************************

integer CMD_ASK = 4545;
integer CMD_REPLY = 4546;

default
{
    touch_start(integer total_number)
    {
        // ask for authentication
        llMessageLinked(LINK_THIS, CMD_ASK, "ask", llDetectedKey(0));
    }

    link_message(integer sender_number, integer number, string message, key id)
    {
        // when get back from server script
        if(number == CMD_REPLY)
        {
            if(message == "OK")
            {
                llWhisper(0, llKey2Name(id) + " is approved.");
            }
            else if(message == "NG")
            {
                llWhisper(0, llKey2Name(id) + " is denied.");
            }
            else if(message == "timeout")
            {
                // usually when target doesn't have authenticator
                llWhisper(0, "authentication timeout.");
            }
        }
    }
}