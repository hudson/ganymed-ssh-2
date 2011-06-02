/*
 * Copyright (c) 2006-2011 Christian Plattner.
 * All rights reserved.
 * Please refer to the LICENSE.txt for licensing details.
 */
package ch.ethz.ssh2.util;

import java.nio.charset.Charset;

/**
 * @author Christian Plattner
 * @version $Id$
 */
public class StringEncoder
{
	public static byte[] GetBytes(String data)
	{
		return data.getBytes(Charset.forName("UTF-8"));
	}

	public static String GetString(byte[] data)
	{
		return GetString(data, 0, data.length);
	}

	public static String GetString(byte[] data, int off, int len)
	{
		return new String(data, off, len, Charset.forName("UTF-8"));
	}
}
