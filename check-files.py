#!/usr/bin/env python3

import glob
import os.path
import sys
import yaml
from zipfile import ZipFile

ALL_STUDENTS_FLAG = "--all-students"
ZIP_OPTION = "--zip-file"
GROUP_WORK_FILE = "group.txt"


def usage():
    print("Usage:")
    print("   ", os.path.basename(sys.argv[0]), "<required-files-yaml>")
    print("   ", os.path.basename(sys.argv[0]), ALL_STUDENTS_FLAG,
          "<required-files-yaml>")
    print("   ", os.path.basename(sys.argv[0]), ZIP_OPTION, "<zip-file-name>",
          "<required-files-yaml>")


def required_files(path):
    with open(path, 'r') as stream:
        try:
            return yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)


def _file_exists(file_name, file_prefix=None):
    if file_prefix is None:
        return os.path.exists(file_name)
    else:
        return os.path.exists(os.path.join(file_prefix, file_name))


def _file_submitted(name, file_prefix, file_exists=_file_exists):
    try:
        status = file_exists(name, file_prefix)
    except TypeError:
        status = False
        for n in name:
            if file_exists(n, file_prefix):
                status = True
                break
    return status


def check_files(required_files, file_prefix=None, file_exists=_file_exists):
    if file_exists(GROUP_WORK_FILE, file_prefix):
        group_work = "\033[36mYES\033[39m"
    else:
        group_work = "\033[36mNO\033[39m"

    print("Group work:", group_work)

    for exercise, files in required_files.items():
        print(exercise)
        for name in files:
            status = _file_submitted(name, file_prefix, file_exists)
            if status:
                status = "\033[32mOK\033[39m"
            else:
                status = "\033[31mmissing\033[39m"

            if isinstance(name, list):
                name = " or ".join(name)

            print("\t%-50s\t%s" % (name, status))


def _check_submission_folder():
    check_files(required_files(sys.argv[1]))


def _check_student_submissions():
    task_path = os.path.join("**", "1_task")
    students = sorted(
        [os.path.dirname(f) for f in glob.glob(task_path, recursive=True)])

    for student in students:
        file_prefix = os.path.join(student, "2_submissions")

        print("\n", os.path.basename(student), sep="")
        if not os.path.exists(file_prefix):
            print("\033[31m\tNO SUBMISSION\033[39m")
        else:
            check_files(required_files(sys.argv[2]), file_prefix)


def _check_zip_file():
    with ZipFile(sys.argv[2], "r") as zip_file:

        def _file_in_zip(file_name, file_prefix=None):
            if not isinstance(file_name, str):
                raise TypeError("Expecting the file name as a string.")
            return file_name in zip_file.namelist()

        check_files(required_files(sys.argv[3]), file_exists=_file_in_zip)
        exit(2)


def main():
    try:
        if len(sys.argv) == 2 and sys.argv[1] != ALL_STUDENTS_FLAG:
            _check_submission_folder()
            exit(0)
        elif len(sys.argv) == 3 and sys.argv[1] == ALL_STUDENTS_FLAG:
            _check_student_submissions()
            exit(0)
        elif len(sys.argv) == 4 and sys.argv[1] == ZIP_OPTION:
            _check_zip_file()
            exit(0)
        else:
            usage()
            exit(1)
    except FileNotFoundError as error:
        print(error)


if __name__ == "__main__":
    main()
