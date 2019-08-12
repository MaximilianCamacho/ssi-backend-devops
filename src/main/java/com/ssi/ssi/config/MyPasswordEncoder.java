package com.ssi.ssi.config;

import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;

public class MyPasswordEncoder extends MessageDigestPasswordEncoder {
    public MyPasswordEncoder() {
        this(1);
    }

    public MyPasswordEncoder(int strength) {
        super("SHA-" + strength);
    }
}
