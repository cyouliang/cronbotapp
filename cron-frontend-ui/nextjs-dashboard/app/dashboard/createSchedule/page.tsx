'use client';

import CustomTextField from '@/app/components/customTextField/custom-text-field';
import FormComponent from '@/app/components/form/form-component';
import styles from '@/app/ui/home.module.css';
import { Button, Paper, Typography } from '@mui/material';
import { useState } from 'react';

export default function Page() {
    return (
        <main>
            <div className={styles.topContainer}>
                <div className={styles.titleHeader}>Create New Schedule</div>
            </div>
            <FormComponent />
        </main>
    );
}