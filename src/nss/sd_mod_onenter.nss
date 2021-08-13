// ****************************************************************
//
// @project Moo Filter 1.2
// @author Sean Darrenkamp
// @date 5/15/2004
// @file sd_test_filter
// Copyright 2004 Sean Darrenkamp
//
// This code is licensed under the GPL for use. See the GNU.org
// site for more information.
//
// http://www.gnu.org/licenses/gpl.html
//
// ****************************************************************

#include "sd_filter_inc"

// Onenter Script for the module events.
void main()
{
    object oPC = GetEnteringObject();

    scanPlayer(oPC);
}
