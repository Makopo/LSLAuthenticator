//*********************************************************************
// LSL Authenticator - Client
//
// (C) Copyright 2018 Mako Nozaki.
// Mako Nozaki is the author's username in the Second Life online virtual world.
// 
// This script is originated from Key Card System "NoMoreOreOre",
// but without client generation stuffs and includes some updated features of LSL.
// (I wrote original in 2008, a DECADE ago!)
// 
// This script can be USED in non-script-focused products.
// This script can NOT be SOLD as it is.
// This script can NOT be APPLIED to script-focused products without Mako Nozaki's approval.
//
// This script officialy resides on GitHub.
// (https://github.com/makopo/LSLAuthenticator)
// 
// If you want client generator / notecard key reading feature / practical sample,
// consider using Key Card System "NoMoreOreOre".
// https://marketplace.secondlife.com/p/Key-Card-System-NoMoreOreOre/446266
// ********************************************************************

// server and client should have the same these two lines here
string MASTER_KEY1 = "INDIVIDUAL_KEY";
string MASTER_KEY2 = "SYSTEM_OR_PRODUCT_KEY";

integer CHANNEL_LISTEN = 3623985;

integer gListenHandle;

start_listening()
{
    llListenRemove(gListenHandle);
    gListenHandle = llListen(CHANNEL_LISTEN, "", NULL_KEY, "send" + (string)llGetOwner());
}

default
{
    state_entry()
    {
        start_listening();
    }

    attach(key attached)
    {
        if(attached)
        {
            start_listening();
        }
    }

    listen(integer channel, string name, key id, string message)
    {
        if(channel == CHANNEL_LISTEN)
        {
            string key1 = llXorBase64(llStringToBase64(MASTER_KEY2), llStringToBase64(MASTER_KEY1));
            string key2 = llXorBase64(llStringToBase64(llGetOwner()), llStringToBase64(key1));
            llWhisper(CHANNEL_LISTEN, key2);
        }
    }
}