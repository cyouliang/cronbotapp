'use client';

import { useEffect, useState } from "react";
import { Button } from "../ui/button";
import dateFormat from 'dateformat';
import styles from '@/app/ui/home.module.css';
import { Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from '@mui/material';
import useSWR from 'swr';

let url = '';

if(process.env.NODE_ENV !== 'production') {
    url = 'http://localhost:3000';
} else {
    url = 'https://cronbot-app.vercel.app';
}

type service_schedule = {
    _id: string,
    serving_person: string,
    serving_username: string,
    email: string,
    date: Date,
}

export default function Page() {
    const [ serviceSchedule, setServiceSchedule ] = useState([]);
    const [ scheduleMasterList, setScheduleMasterList ] = useState([]);
    const [ expandTable, setExpandTable ] = useState(false);

    const fetcher = (url: any) => fetch(url).then((res) => res.json()).then((data) => setServiceSchedule(data))

    const {data, error} = useSWR(`${url}/api/fetchUpcomingData`, fetcher, { refreshInterval: 60000 });

    if (error || !data) {
        console.log("Error fetching data");
    }
    // useEffect(() => {
        // fetch(`${url}/api/fetchUpcomingData`)
        // .then((res) => res.json())
        // .then((data) => setServiceSchedule(data))
    // },[]);

    const fetchAllData = async () => {
        if (scheduleMasterList.length > 0) {
            setExpandTable(true);
        } else {
            try {
                let response = await fetch(`${url}/api/fetchAllData`);
                console.log("response is = ", response);
                let data = await response.json();
                if (data.length > 0) {
                    setExpandTable(true);
                }
                setScheduleMasterList(data);
            }
            catch (err) {
                alert(err);
                console.log('Error occurred while fetching data ', err);
            }
        }
    }

    const collapseData = () => {
        setExpandTable(false);
    }

    return (
        <div>
            <div className={styles.topContainer}>
                <h2 className={styles.titleHeader}>Duty Roster</h2>
                <div className={styles.serviceCard}>
                    { serviceSchedule.length > 0?
                        (serviceSchedule.map((entry: service_schedule) => (
                                <div className={styles.serviceText} key={entry._id}>
                                    <p style={{textDecoration: "underline"}}>Upcoming personnel on duty:</p>
                                    <p>-- {dateFormat(entry.date, "dddd, mmmm dS, yyyy")}</p>
                                    <p>-- {entry.serving_person}</p>
                                </div>
                        ))) :
                        (<div className={styles.serviceText}>There is no upcoming schedule...</div>)
                    }
                </div>
                <div className="styles.btnContainer">
                    { expandTable?
                    (<Button className="button" onClick={collapseData}>Minimize</Button>)
                    :
                    (<Button className="button" onClick={fetchAllData}>Whole schedule</Button>)
                    }
                </div>
            </div>
            {expandTable? 
                (<div className={styles.btmContainer}>
                    <TableContainer component={Paper}>
                        <Table stickyHeader sx={{ minWidth: 650 }} aria-label="simple table">
                            <TableHead>
                                <TableRow>
                                    <TableCell style={{ textDecoration: "underline"}}>Date of service:</TableCell>
                                    <TableCell style={{ textDecoration: "underline"}}>Personnel serving</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {scheduleMasterList.map((entry: service_schedule) => (
                                    <TableRow key={entry._id} sx={{ '&:last-child td, &:last-child th': { border: 0 } }}>
                                        <TableCell component="th" scope="row">{dateFormat(entry.date, "dddd, mmmm dS, yyyy")}</TableCell>
                                        <TableCell>{entry.serving_person}</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                </div>) : (<div></div>)}
        </div>
    );
}